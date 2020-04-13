import Foundation

struct Card {
    var value: String = ""
    var suit: String = ""

    func name() -> String {
        "\(value) of \(suit)"
    }
}
