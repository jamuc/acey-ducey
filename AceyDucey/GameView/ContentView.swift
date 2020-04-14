import SwiftUI

struct ContentView: View {
    @EnvironmentObject  var settings: UserSettings

    @State private var cards = Deck().createDeck()
    @State private var betPlaced = ""

    var body: some View {
        NavigationView {
            VStack(alignment: HorizontalAlignment.center, spacing: 40) {
                Text("Acey Ducey")
                    .font(.largeTitle)

                HStack(alignment: .center, spacing: CGFloat(20.0)) {
                    CardView(card: cards[0])
                    CardView(card: cards[1])
                }

                TextField("Place bet", text: $betPlaced)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
