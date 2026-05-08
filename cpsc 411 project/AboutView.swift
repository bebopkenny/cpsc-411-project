// SwiftUI gives us all the views used here
import SwiftUI

// aboutview shows basic info about the app like the name, version, class, and team members
// uses a Form so it looks like a normal settings page on iOS
struct AboutView: View {
    var body: some View {
        // Form groups rows into sections, same look as the iOS Settings app
        Form {
            Section(header: Text("App")) {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("Jot")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0")
                        .foregroundColor(.gray)
                }
            }

            Section(header: Text("Class")) {
                Text("CPSC 411")
            }

            Section(header: Text("Made by")) {
                Text("Kenny Garcia")
                Text("Babiker Babiker")
            }

            Section(header: Text("About")) {
                Text("Jot is a simple notes app where you can write quick thoughts and save them on your phone.")
            }
        }
        .navigationTitle("About")
    }
}
