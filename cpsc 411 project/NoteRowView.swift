// swiftUI gives us all the views used here
import SwiftUI

// noterowview is the small row that shows up for each note in the main list
// it shows the title and date on the top line, and a short body preview below
struct NoteRowView: View {

    // the note we want to display in this row
    let note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                // if the title is empty, show "new note" as a fallback so the row isn't blank
                Text(note.title.isEmpty ? "New Note" : note.title)
                    .font(.headline)
                    .lineLimit(1)
                Spacer()
                // formatted date on the right side of the title row
                Text(formattedDate(note.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            // short preview of the body, cut off at one line
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
