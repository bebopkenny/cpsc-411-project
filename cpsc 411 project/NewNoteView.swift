// SwiftUI gives us all the views and property wrappers used here
import SwiftUI

private struct NoteTemplate {
    let name: String
    let title: String
    let body: String
}

private let templates: [NoteTemplate] = [
    NoteTemplate(name: "Blank", title: "", body: ""),
    NoteTemplate(name: "Meeting", title: "Meeting Notes", body: "Date: \nAttendees: \n\nAgenda:\n- \n\nNotes:\n\nAction Items:\n- "),
    NoteTemplate(name: "Journal", title: today(), body: "Today I...\n\nI'm grateful for:\n\nGoal for tomorrow:"),
    NoteTemplate(name: "To-Do", title: "To-Do List", body: "[ ] \n[ ] \n[ ] "),
    NoteTemplate(name: "Idea", title: "New Idea", body: "Problem:\n\nSolution:\n\nNext Steps:\n- ")
]

private func today() -> String {
    let f = DateFormatter()
    f.dateStyle = .long
    return f.string(from: Date())
}

// newnoteview is the screen for creating a brand new note
// it's a sheet so it slides up from the bottom when the user taps the pencil icon
struct NewNoteView: View {
    var store: NoteStore

    // dismiss lets us close this sheet programmatically
    @Environment(\.dismiss) private var dismiss

    // local state for the title and body, we only write to the store when the user taps save
    @State private var title = ""
    @State private var content = ""
    @State private var selectedTemplate = 0

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    // horizontally scrollable template chips
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(templates.indices, id: \.self) { i in
                                Button(templates[i].name) {
                                    selectedTemplate = i
                                    title = templates[i].title
                                    content = templates[i].body
                                }
                                .font(.subheadline)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 7)
                                .background(selectedTemplate == i ? Color.yellow : Color(.systemGray5))
                                .foregroundColor(selectedTemplate == i ? .black : .primary)
                                .clipShape(Capsule())
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 12)
                        .padding(.bottom, 4)
                    }

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
