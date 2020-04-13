import SwiftUI

struct CardView: View {
    var card: Card

    var body: some View {
        Text(card.name())
            .frame(width: 120, height: 180, alignment: .center)
            .background(Color.gray)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black, radius: 20, x: 20, y: 20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(value: "1", suit: "hearts"))
    }
}
