// EmptyNotesView
// this view shows up when the user has no notes saved yet
// it is a simple VStack with an icon and two short lines of text
// ContentView will switch to this view when store.notes is empty

import SwiftUI

struct EmptyNotesView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Image(systemName: "note.text")
                .font(.system(size: 60))
                .foregroundColor(.gray)

            Text("No notes yet")
                .font(.title2)
                .fontWeight(.semibold)

            Text("Tap the pencil button to make your first note")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EmptyNotesView()
}
