import SwiftUI


@main
struct BootCampApp: App {
    @StateObject var router = PublisherRouter()
    
    var body: some Scene {
        WindowGroup {
            router.router.body
        }
    }
}
