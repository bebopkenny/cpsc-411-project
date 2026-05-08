// swiftUI gives us all the views and property wrappers used here
import SwiftUI

// notedetailview is the editing screen for an existing note
// note is a @binding so any changes here automatically show up back in the list
// store is passed in so we can call update() whenever the user types something
struct NoteDetailView: View {
    @Binding var note: Note
    var store: NoteStore

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {

                // big bold title field at the top, just like Apple Notes
                // onchange fires every time the user types a character and saves immediately
                TextField("Title", text: $note.title)
                    .font(.title.bold())
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .onChange(of: note.title) { store.update(note) }
                    .padding(.bottom, 12)

                // the main body of the note, TextEditor lets the user type multiple lines
                TextEditor(text: $note.body)
                    .font(.body)
                    .frame(minHeight: 500)
                    .padding(.horizontal, 12)
                    .onChange(of: note.body) { store.update(note) }

                // word and character count, something Apple Notes doesn't show
                // split on whitespace to count words, .count on the string gives us characters
                let words = note.body.split(whereSeparator: \.isWhitespace).count
                let chars = note.body.count

                Text("\(words) words · \(chars) characters")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
