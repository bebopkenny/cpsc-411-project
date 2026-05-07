// AboutView
// shows basic info about the app like name, version, class, and team members
// uses a Form so it looks like a normal settings page on iOS
// will be reached from a toolbar link in ContentView once that gets wired up

import SwiftUI

struct AboutView: View {
    var body: some View {
        // Form makes the grouped row look like the Settings app
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

#Preview {
    NavigationStack {
        AboutView()
    }
}
