// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftCrossUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup("My First App") {
            VStack {
                Text("Hello from Windows!")
                Button("Click Me") {
                    print("Button tapped!")
                }
            }
        }
    }
}
