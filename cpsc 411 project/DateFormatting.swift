// DateFormatting
// small helper file with one function called formattedDate
// it takes a Date value and returns a nice readable string like May 6 2026
// any view that needs to show a date can call this function
// keeping it in one file means we only have to change the format in one place

import Foundation

// turns a Date into a short readable string
func formattedDate(_ date: Date) -> String {
    // a DateFormatter is the Apple class that knows how to turn dates into strings
    let formatter = DateFormatter()
    // medium style gives us something like May 6 2026
    formatter.dateStyle = .medium
    // we do not want the time of day in the string
    formatter.timeStyle = .none
    // ask the formatter to do the conversion and return the result
    return formatter.string(from: date)
}
