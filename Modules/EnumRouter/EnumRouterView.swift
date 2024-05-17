import SwiftUI

struct Preview: PreviewProvider {
    @StateObject var router = PublisherRouter()
    static var previews: some View {
        PublisherRouter().router.body
            .onReceive(router.$router, perform: { value in
                print(value.rawValue)
            })
    }
}

struct Main: View {
    @StateObject var router = PublisherRouter()
    
    var body: some View {
        VStack {
            Text("Main")
//            ForEach(RouterEnum.allCases, id: \.id ) { view in
//                if view.id != router.router.id {
//                    Button {
//                        router.router = view
//                    } label: {
//                        Text(view.rawValue)
//                    }
//                }
//            }
            Button {
                router.router = .settings
            } label: {
                Text("settings")
            }
            Button {
                router.router = .menu
            } label: {
                Text("menu")
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
