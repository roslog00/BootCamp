import SwiftUI


@main
struct BootCampApp: App {
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            router.router.body
        }
    }
}
