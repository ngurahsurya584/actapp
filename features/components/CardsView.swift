//
//  CardsView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 12/05/24.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        VStack{
            Button(action: {
                // Action to perform when the button is tapped
                print("Button tapped!")
            }) {
                Text("")
            }
            .buttonStyle(CardButton())
        }
    }
}


struct CardButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 170, height: 219)
            .background(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .black, location: 0),
                        .init(color: .cardbottomcolor, location: 0.3),
                        .init(color: .cardbottomcolor, location: 1)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}

#Preview {
    CardsView()
}
