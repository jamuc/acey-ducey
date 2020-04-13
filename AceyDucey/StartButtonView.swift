import SwiftUI

extension View {
    func pulsatingOverlay(color: Color) -> some View {
        self.modifier(PulsatingOverlay(color: color))
    }
}

struct PulsatingOverlay: ViewModifier {
    var color: Color

    @State private var animationValue: CGFloat = 1

    func body(content: Content) -> some View {
        content
        .overlay(
            Circle()
                .stroke(Color.blue)
                .scaleEffect(animationValue)
                .opacity(Double(1.5 - animationValue))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animationValue = 1.5
        }
    }
}

struct StartButtonView: View {

    var body: some View {
        Button(action: {
            // my action
        }) {
            Text("START")
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(Color.white)
        .clipShape(Circle())
        .pulsatingOverlay(color: Color.blue)
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
    }
}
