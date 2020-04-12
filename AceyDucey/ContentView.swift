import SwiftUI

struct ContentView: View {
    @State private var displayGameRules = true

    var body: some View {
        HStack {
            Text("Hello, World!")
        }.sheet(isPresented: $displayGameRules) {
            VStack {
                RulesView()
                Spacer()
                StartButtonView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
