import SwiftUI

struct ContentView: View {
    @EnvironmentObject  var settings: UserSettings

    @State private var cards = Deck().cards
    @State private var betPlaced = ""

    @State private var displayThirdCard = false

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var displayAlert = false

    var body: some View {
        NavigationView {
            VStack(alignment: HorizontalAlignment.center, spacing: 40) {
                Text("Acey Ducey")
                    .font(.largeTitle)

                ZStack {
                    HStack(alignment: .center, spacing: 20) {
                        CardView(card: cards[0])
                        CardView(card: cards[1])
                    }
                }

                TextField("Place bet", text: $betPlaced, onCommit: placeBet)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if displayThirdCard {
                    CardView(card: cards[3])
                }

                Spacer()
                Text("Cards remaining: \(cards.count)")
            }
            .navigationBarItems(trailing: Text("$ 100"))
        }
        .sheet(isPresented: $settings.displayGameRules) {
            VStack {
                RulesView()
                Spacer()
                StartButtonView().environmentObject(self.settings)
            }
        }
        .alert(isPresented: $displayAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK"), action: nextRound))
        }
    }

    func nextRound() {
        displayThirdCard = false
        betPlaced = ""

        // check if next round can be played (more than 3 cards left)
        cards.remove(at: 0)
        cards.remove(at: 0)
        cards.remove(at: 0)
    }

    func placeBet() {
        displayThirdCard = true

        let won = cards[0] < cards[3] && cards[3] < cards[1]
        let bet = Int(betPlaced) ?? 0

        if won && bet == 0 {
            alertTitle = "You should have place a bet"
            alertMessage = "If you would have placed a bet you would have won some money"
        } else if won && bet != 0 {
            alertTitle = "You won!!"
            alertMessage = "Well done, you won"
        } else if !won && bet == 0 {
            alertTitle = "Well done"
            alertMessage = "You where right not to bet. Your would have lost"
        } else if !won && bet != 0 {
            alertTitle = "Ouch, sorry"
            alertMessage = "You lost this round"
        }

        displayAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
