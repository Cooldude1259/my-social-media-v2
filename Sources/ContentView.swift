import SwiftUI
import Supabase

struct ContentView: View {
    @State private var count = 0

    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://bmfbnydcanksjwquljzb.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtZmJueWRjYW5rc2p3cXVsanpiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjY3MzA0MjksImV4cCI6MjA4MjMwNjQyOX0.d7sVVng0ZVOzE-yLXjMhiKr7cUodIP9C8v4zoVQxZHo"
    )

    func signInWithGitHub() async {
        do {
            try await supabase.auth.signInWithOAuth(provider: .github)
        } catch {
            print("Sign-in failed: /(error)")
        }
    }

    func signInWithGoogle() async {
        do {
            try await supabase.auth.signInWithOAuth(provider: .google)
        } catch {
            print("Sign-in failed: /(error)")
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            
            
            Text("Welcome to ConnectEd!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Button {
                Task { await signInWithGitHub() }

            } label: {
                Text("Sign in with GitHub")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button {
                Task { await signInWithGoogle() }

            } label: {
                Text("Sign in with Google")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("Button pressed: \(count) times")
                .font(.body)
                .foregroundColor(.secondary)
            
            Button(action: {
                count += 1
                Analytics.log("button_tap", params: ["count": count])
            }) {
                Text("Tap Me")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}
