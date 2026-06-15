import SwiftUI

@main
struct MyFirstSwiftUIApp: App {
    init() {
        // Fires once per launch so you can see real usage in GA4.
        Analytics.log("app_open")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
