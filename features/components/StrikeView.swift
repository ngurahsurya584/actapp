//
//  StrikeView.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 18/05/24.
//

import SwiftUI




struct StrikeView: View {
    var body: some View {
        VStack{
            Button(action: {
                // Action to perform when the button is tapped
                print("Button tapped!")
            }) {
                Text("")
            }
            .buttonStyle(StrikeButton())
        }
    }
}


struct StrikeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 90, height: 40)
            .background(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .green, location: 0),
                        .init(color: .cardbottomcolor, location: 0.3),
                        .init(color: .cardbottomcolor, location: 1)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .foregroundColor(.green)
            .cornerRadius(20)
    }
}

#Preview {
    StrikeView()
}

