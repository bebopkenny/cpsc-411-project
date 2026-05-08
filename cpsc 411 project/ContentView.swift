// swiftUI is the framework that gives us all the views, buttons, lists, and navigation
import SwiftUI

// contentview is the main screen, it shows the list of notes and handles navigation
struct ContentView: View {

    // @stateobject creates the notestore and keeps it alive for the lifetime of this view
    @StateObject var store = NoteStore()

    // appstorage reads and writes directly to UserDefaults so the value survives app restarts
    // we use this to track if the user has already seen the welcome screen
    @AppStorage("hasSeenWelcome") private var hasSeenWelcome: Bool = false

    // these three booleans control which sheet is currently showing
    @State private var showWelcome = false
    @State private var showAbout = false
    @State private var showNewNote = false

    var body: some View {
        NavigationStack {
            Group {
                // if there are no notes, show the empty state instead of an empty list
                if store.notes.isEmpty {
                    EmptyNotesView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // loop over every note and make a tappable row that navigates to the editor
                    // we use $store.notes (binding) so edits in NoteDetailView update the list live
                    List {
                        ForEach($store.notes) { $note in
                            NavigationLink(destination: NoteDetailView(note: $note, store: store)) {
                                NoteRowView(note: note)
                            }
                        }
                        // swipe left on any row to delete it
                        .onDelete { offsets in
                            store.delete(at: offsets)
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                // about button on the left opens the about page as a sheet
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("About") { showAbout = true }
                        .foregroundColor(.yellow)
                }
                // pencil icon on the right opens the new note sheet
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewNote = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .sheet(isPresented: $showAbout) {
                NavigationStack { AboutView() }
            }
            .sheet(isPresented: $showNewNote) {
                NewNoteView(store: store)
            }
            .sheet(isPresented: $showWelcome) {
                WelcomeSheet()
            }
            // when the view appears, load saved notes and show the welcome screen if needed
            .onAppear {
                store.load()
                if !hasSeenWelcome {
                    showWelcome = true
                }
            }
        }
    }
}
