import SwiftUI

@main
struct ADD_3_0App: App {
    @State private var score: Int = 0  // Define the score state variable

    var body: some Scene {
        WindowGroup {
            HomePage(score: $score)  // Pass the binding to HomePage
        }
    }
}
