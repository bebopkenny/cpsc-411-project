// WelcomeSheet
// the popup that shows the first time the user opens the app
// it has an icon, a welcome title, a short description, and a Get Started button
// once the user taps Get Started the sheet closes and never shows again
// we remember they saw it by saving a flag with @AppStorage

import SwiftUI

struct WelcomeSheet: View {
    // AppStorage saves the value to UserDefaults and updates the view when it changes
    // the string in the quotes is the name we use to find this value later
    @AppStorage("hasSeenWelcome") private var hasSeenWelcome: Bool = false

    // dismiss is a built in environment action that closes a sheet
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        // VStack stacks all the welcome content from top to bottom
        VStack(spacing: 24) {
            // Spacer pushes the icon down so it ends up roughly centered
            Spacer()

            // a friendly notepad icon at the top
            Image(systemName: "note.text")
                .font(.system(size: 80))
                .foregroundColor(.yellow)

            // the big welcome headline
            Text("Welcome to Jot")
                .font(.largeTitle)
                .fontWeight(.bold)

            // a short description of what the app does
            Text("A simple place to write down your thoughts and save them on your phone.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // another Spacer so the button gets pushed to the bottom
            Spacer()

            // the Get Started button that closes the sheet
            Button {
                // flip the flag so the sheet will not show next time the app opens
                hasSeenWelcome = true
                // close this sheet
                dismiss()
            } label: {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    WelcomeSheet()
}
