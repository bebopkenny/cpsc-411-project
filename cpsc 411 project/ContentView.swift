import SwiftUI

struct ContentView: View {
    @StateObject var store = NoteStore()
    @AppStorage("hasSeenWelcome") private var hasSeenWelcome: Bool = false
    @State private var showWelcome = false
    @State private var showAbout = false
    @State private var showNewNote = false

    var body: some View {
        NavigationStack {
            Group {
                if store.notes.isEmpty {
                    EmptyNotesView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach($store.notes) { $note in
                            NavigationLink(destination: NoteDetailView(note: $note, store: store)) {
                                NoteRowView(note: note)
                            }
                        }
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
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("About") { showAbout = true }
                        .foregroundColor(.yellow)
                }
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
            .onAppear {
                store.load()
                if !hasSeenWelcome {
                    showWelcome = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
