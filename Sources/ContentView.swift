import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 20) {
            
            
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
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
