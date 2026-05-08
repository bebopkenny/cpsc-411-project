// foundation gives us basic types like UUID and Date
import Foundation

// this is the data model for a single note
// every note has an id so we can tell them apart, a title, a body, and the date it was made
// codable lets us convert notes to/from JSON so we can save them
// identifiable is what lets SwiftUI loop over a list of notes without getting confused
struct Note: Identifiable, Codable {
    var id: UUID
    var title: String
    var body: String
    var date: Date
}
