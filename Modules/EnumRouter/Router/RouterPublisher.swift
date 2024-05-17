import SwiftUI

final class PublisherRouter: ObservableObject {
    @Published var router = RouterEnum.main
}
