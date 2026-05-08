// swiftUI gives us all the views and property wrappers used here
import SwiftUI

// welcomesheet is the popup that shows the first time the user opens the app
// once they tap "get started" it never shows again
struct WelcomeSheet: View {

    // appstorage saves this flag to UserDefaults so it persists after the app closes
    // the string in quotes is the key we use to look it up later
    @AppStorage("hasSeenWelcome") private var hasSeenWelcome: Bool = false

    // dismiss is a built in action that closes this sheet
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            // friendly icon at the top
            Image(systemName: "note.text")
                .font(.system(size: 80))
                .foregroundColor(.yellow)

            // welcome headline
            Text("Welcome to Jot")
                .font(.largeTitle)
                .fontWeight(.bold)

            // short description of what the app does
            Text("A simple place to write down your thoughts and save them on your phone.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()

            // tapping this flips the flag so the sheet won't show next time, then closes
            Button {
                hasSeenWelcome = true
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
