import Foundation

class Deck {
    var cards: [Card] = []

    let suits = ["spades", "hearts", "diamonds", "clubs"]
    let values = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

    init() {
        for suit in suits {
            for value in values {
                let card = Card(value: value, suit: suit)
                cards.append(card)
            }
        }

        cards.shuffle()
    }
}
