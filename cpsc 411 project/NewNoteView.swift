import SwiftUI

struct NewNoteView: View {
    var store: NoteStore
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    TextField("Title", text: $title)
                        .font(.title.bold())
                        .padding(.horizontal)
                        .padding(.top, 16)
                    .padding(.bottom, 12)

                    TextEditor(text: $content)
                        .font(.body)
                        .frame(minHeight: 500)
                        .padding(.horizontal, 12)
                }
            }
            .navigationTitle("New Note")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
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
