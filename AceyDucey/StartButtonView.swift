//
//  StartButtonView.swift
//  AceyDucey
//
//  Created by Jason Franklin on 12.04.20.
//  Copyright © 2020 Jason Franklin. All rights reserved.
//

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
                .opacity(Double(2 - animationValue))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animationValue = 2
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
