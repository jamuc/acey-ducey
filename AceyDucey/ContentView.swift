import SwiftUI

struct ContentView: View {
    @EnvironmentObject  var settings: UserSettings

    var body: some View {
        HStack {
            Text("Hello, World!")
        }.sheet(isPresented: $settings.displayGameRules) {
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
