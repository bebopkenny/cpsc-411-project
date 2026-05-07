import Foundation
import Combine

class NoteStore: ObservableObject {
    @Published var notes: [Note] = []

    func load() {}

    func save() {}

    func add(_ note: Note) {}

    func delete(at offsets: IndexSet) {}

    func update(_ note: Note) {}
}
