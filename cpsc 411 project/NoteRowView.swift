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
        // VStack puts the title above the second row of info
        VStack(alignment: .leading, spacing: 4) {
            // the note title in a bold style
            Text(note.title)
                .font(.headline)

            // HStack puts the body preview on the left and the date on the right
            HStack {
                // a short preview of the note body
                Text(note.body)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)

                // Spacer pushes the date all the way to the right side
                Spacer()

                // the date shown in a friendly format
                Text(formattedDate(note.date))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
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
