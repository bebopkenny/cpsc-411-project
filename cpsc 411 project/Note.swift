import Foundation

struct Note: Identifiable, Codable {
    var id: UUID
    var title: String
    var body: String
    var date: Date
}
