import SwiftUI

@main
struct BootCampApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(router: PublisherRouter())
        }
    }
}
