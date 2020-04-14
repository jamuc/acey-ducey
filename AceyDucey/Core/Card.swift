import Foundation

struct Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        lhs.numericValue() < rhs.numericValue()
    }

    var value: String = ""
    var suit: String = ""

    func name() -> String {
        "\(value) of \(suit)"
    }

    private func numericValue() -> Int {
        if value == "J" {
            return 11
        } else if value == "Q" {
            return 12
        } else if value == "K" {
            return 13
        } else if value == "A" {
            return 14
        }

        return Int(value) ?? 0
    }
}
