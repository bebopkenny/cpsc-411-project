import Foundation
import Combine
import SwiftUI

class NoteStore: ObservableObject {
    @Published var notes: [Note] = []

    let key = "saved_notes"

    func load() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([Note].self, from: data) else { return }
        notes = decoded.sorted { $0.date > $1.date }
    }

    func save() {
        notes.sort { $0.date > $1.date }
        guard let encoded = try? JSONEncoder().encode(notes) else { return }
        UserDefaults.standard.set(encoded, forKey: key)
    }

    func add(_ note: Note) {
        notes.append(note)
        save()
    }

    func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        save()
    }

    func update(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            var updated = note
            updated.date = Date()
            notes[index] = updated
            save()
        }
    }
}
