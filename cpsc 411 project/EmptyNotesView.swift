// EmptyNotesView
// this view shows up when the user has no notes saved yet
// it is a simple VStack with an icon and two short lines of text
// ContentView will switch to this view when store.notes is empty

import SwiftUI

struct EmptyNotesView: View {
    var body: some View {
        // VStack stacks views from top to bottom
        VStack(spacing: 16) {
            Image(systemName: "note.text")
                .font(.system(size: 60))
                .foregroundColor(.gray)

            Text("No notes yet")
                .font(.title2)
                .fontWeight(.semibold)

            // smaller hint text below the title
            Text("Tap the plus button to make your first note")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    EmptyNotesView()
}
