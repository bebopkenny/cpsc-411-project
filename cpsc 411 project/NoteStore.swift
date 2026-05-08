// foundation gives us basic Swift types like Data and UserDefaults
import Foundation
// combine is needed for ObservableObject and @Published to work
import Combine
// swiftUI is imported here because remove(atOffsets:) is a SwiftUI extension on arrays
import SwiftUI

// notestore is the brain of the app, it holds all the notes and handles saving and loading
// observableobject means any view watching this will automatically update when notes change
class NoteStore: ObservableObject {

    // @published means SwiftUI re-renders any view that uses this whenever the array changes
    @Published var notes: [Note] = []

    // this is the key we use to find our data in UserDefaults, like a label on a box
    let key = "saved_notes"

    // pulls saved notes out of UserDefaults and decodes them from JSON (called when the app opens)
    // if nothing is saved yet, the guard just exits early and notes stays empty
    func load() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([Note].self, from: data) else { return }
        // sort newest first right away so the list looks right from the start
        notes = decoded.sorted { $0.date > $1.date }
    }

    // called after every change, writes notes to UserDefaults as JSON
    func save() {
        guard let encoded = try? JSONEncoder().encode(notes) else { return }
        UserDefaults.standard.set(encoded, forKey: key)
    }

    // adds a new note to the array and saves right away
    func add(_ note: Note) {
        notes.append(note)
        save()
    }

    // removes one or more notes based on where the user swiped, offsets come from SwiftUI's onDelete
    func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        save()
    }

    // finds the matching note by id, stamps it with the current time, replaces it, then saves
    // updating the date means edited notes bubble back up to the top of the list
    func update(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            var updated = note
            updated.date = Date()
            notes[index] = updated
            save()
        }
    }
}
