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
    }

    func placeBet() {
        displayThirdCard = true

        if cards[0] < cards[3],
            cards[3] < cards[1] {
            print("You won lucky you")
        } else {
            print("You lost, unlucky you")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
