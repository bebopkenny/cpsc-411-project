import SwiftUI

struct ContentView: View {
    @StateObject var store = NoteStore()

    var body: some View {
        Text("Jot")
    }
}

#Preview {
    ContentView()
}
