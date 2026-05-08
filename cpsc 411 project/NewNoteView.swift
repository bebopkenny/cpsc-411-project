// SwiftUI gives us all the views and property wrappers used here
import SwiftUI

// newnoteview is the screen for creating a brand new note
// it's a sheet so it slides up from the bottom when the user taps the pencil icon
struct NewNoteView: View {
    var store: NoteStore

    // dismiss lets us close this sheet programmatically
    @Environment(\.dismiss) private var dismiss

    // local state for the title and body, we only write to the store when the user taps save
    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    // same layout as the edit screen, big title at the top
                    TextField("Title", text: $title)
                        .font(.title.bold())
                        .padding(.horizontal)
                        .padding(.top, 16)
                        .padding(.bottom, 12)

                    // body text editor below the title
                    TextEditor(text: $content)
                        .font(.body)
                        .frame(minHeight: 500)
                        .padding(.horizontal, 12)
                }
            }
            .navigationTitle("New Note")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // cancel just closes the sheet without saving anything
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                // save creates the note, adds it to the store, and closes the sheet
                // the button is disabled until the user types a title
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        store.add(Note(id: UUID(), title: title, body: content, date: Date()))
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                    .foregroundColor(.yellow)
                }
            }
        }
    }
}
