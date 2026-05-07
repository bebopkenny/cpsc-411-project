// NoteRowView
// the small row that shows up inside the main list of notes
// each row shows the title in bold and a short preview of the body
// it also shows the date the note was created using our shared date helper
// the teammate will use this view inside the List in ContentView

import SwiftUI

struct NoteRowView: View {
    // the note we want to display in this row
    let note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(note.title.isEmpty ? "New Note" : note.title)
                    .font(.headline)
                    .lineLimit(1)
                Spacer()
                Text(formattedDate(note.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Text(note.body.isEmpty ? "No additional text" : note.body)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    // a fake note so we can see what the row looks like in the canvas
    NoteRowView(note: Note(
        id: UUID(),
        title: "Sample title",
        body: "This is what the body preview looks like in the row",
        date: Date()
    ))
    .padding()
}
