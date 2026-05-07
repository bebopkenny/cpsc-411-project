import SwiftUI

struct NoteDetailView: View {
    @Binding var note: Note
    var store: NoteStore

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                TextField("Title", text: $note.title)
                    .font(.title.bold())
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .onChange(of: note.title) { store.update(note) }
                    .padding(.bottom, 12)

                TextEditor(text: $note.body)
                    .font(.body)
                    .frame(minHeight: 500)
                    .padding(.horizontal, 12)
                    .onChange(of: note.body) { store.update(note) }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
