import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "iphone.radiowaves.left.and.right")
                =font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Button pressed: \(count) times")
                .font(.body)
                .foregroundColor(.secondary)
            
            Button(action: {
                count += 1
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
