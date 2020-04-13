import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var displayGameRules: Bool = true
}
