import SwiftUI

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
