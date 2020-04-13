import SwiftUI

struct ContentView: View {
    @EnvironmentObject  var settings: UserSettings

    @State private var cardDeck = Deck()
    @State private var betPlaced = ""

    var body: some View {
        NavigationView {
            VStack(alignment: HorizontalAlignment.center, spacing: 40) {
                Text("Acey Ducey")
                    .font(.largeTitle)

                HStack(alignment: .center, spacing: 20) {
                    CardView(card: cardDeck.cards[0])
                    CardView(card: cardDeck.cards[1])
                }

                TextField("Place bet", text: $betPlaced)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
                Text("Cards remaining: \(cardDeck.cards.count)")
            }
            .navigationBarItems(trailing: Text("$ 100"))
        }
        .onAppear {
            self.cardDeck.shuffle()
        }
        .sheet(isPresented: $settings.displayGameRules) {
            VStack {
                RulesView()
                Spacer()
                StartButtonView().environmentObject(self.settings)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
