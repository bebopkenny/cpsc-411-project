// swiftUI gives us all the views used here
import SwiftUI

// emptynotesview shows up when the user has no notes saved yet
// contentview switches to this view when store.notes is empty
struct EmptyNotesView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            // icon at the top to make it look less bare
            Image(systemName: "note.text")
                .font(.system(size: 60))
                .foregroundColor(.gray)

            Text("No notes yet")
                .font(.title2)
                .fontWeight(.semibold)

            // small hint so the user knows what to do
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
