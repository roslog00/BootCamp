import SwiftUI

final class Router: ObservableObject {
    @Published var router = RouterEnum.main
}

enum RouterEnum: String, CaseIterable {
    case main, menu, settings
    
    var id: String {
        switch self {
        case .main:
            "324bjhkb5kuResources"
        case .menu:
            "54jhb6kjh54blk2"
        case .settings:
            "32hjrb2j3hrv"
        }
    }
    
    
    @ViewBuilder
    var body: some View {
        switch self {
        case .main :
            Main()
        case .menu:
            Menu()
        case .settings:
            Settings()
        }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        Router().router.body
    }
}

struct Main: View {
    @StateObject var router = Router()
    
    var body: some View {
        VStack {
            Text(router.router.rawValue)
            Spacer()
            Button {
                router.router = RouterEnum.settings
            } label: {
                Text("Go to settings")
            }
        }
    }
}

struct Menu: View {
    var body: some View {
        VStack {
            Text("menu")
        }
    }
}

struct Settings: View {
    var body: some View {
        VStack {
            Text("setting")
        }
    }
}
