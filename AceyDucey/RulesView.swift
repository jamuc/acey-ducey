//
//  RulesView.swift
//  AceyDucey
//
//  Created by Jason Franklin on 12.04.20.
//  Copyright © 2020 Jason Franklin. All rights reserved.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Text("Acey-Ducey rules")
                .font(.title)
            VStack(alignment: .leading, spacing: 20) {
                Text("Acey-Ducey is played in the following manner.")
                Text("The dealer (computer) deals two cards face up. You have an option to bet or not bet depending on wether or not you fee the card will have a value between the first two.")
                Text("You have an option to bet or not to bet depending on whether or not you feel the card will have a value between the first two.")
                Text("If you do not want to bet, input A 0")
                Text("If you bet correctly, your bet will be doubled. If you were wrong you will loose the bet.")
                Text("If you run out of money you loose the game. If the dealer runs out of cards, you win.")
            }
        }
        .padding()
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
