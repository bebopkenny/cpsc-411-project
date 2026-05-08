// foundation gives us Date and DateFormatter
import Foundation

// small helper that turns a Date into a readable string like "May 6 2026"
// any view that needs to show a date calls this instead of formatting it themselves
func formattedDate(_ date: Date) -> String {
    // DateFormatter is the apple class that knows how to convert dates into strings
    let formatter = DateFormatter()
    // medium style gives us something like "May 6 2026", not too long and not too short
    formatter.dateStyle = .medium
    // we don't want the time of day in the string, just the date
    formatter.timeStyle = .none
    return formatter.string(from: date)
}
