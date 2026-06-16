import SwiftUI
import Supabase

@main
struct MyFirstSwiftUIApp: App {
    init() {
        // Fires once per launch so you can see real usage in GA4.
        Analytics.log("app_open")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                // When the OAuth login finishes, the browser reopens the app via
                // connected://login-callback?... — hand that URL to Supabase to
                // complete the sign-in and store the session.
                .onOpenURL { url in
                    Task {
                        do {
                            try await supabase.auth.session(from: url)
                        } catch {
                            print("OAuth callback failed: \(error)")
                        }
                    }
                }
        }
    }
}
