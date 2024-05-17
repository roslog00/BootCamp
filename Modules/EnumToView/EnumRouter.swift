import SwiftUI

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
            ForEach(RouterEnum.allCases, id: \.id ) { view in
                
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
