//
//  WhiteButtonView.swift
//  actapp
//
//  Created by Channy Lim on 13/05/24.
//

import SwiftUI

struct WhiteButtonView: View {
    let buttonText: String
    
    init(buttonText: String) {
        self.buttonText = buttonText
    }
    
    var body: some View {
        VStack{
            Button(buttonText) {
                        print("Button pressed!")
                    }
                    .buttonStyle(WhiteButton())
        }
    }
}

struct WhiteButton: ButtonStyle {
    func makeBody(configuration:
        
        Configuration) -> some View {
        configuration.label
            .padding().frame(maxWidth: .infinity)
            .background(Color(red: 255, green: 255, blue: 255))
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    WhiteButtonView(buttonText: "Next")
}
