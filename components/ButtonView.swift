//
//  ButtonView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 07/05/24.
//

import SwiftUI

struct ButtonView: View {
    let buttonText: String
    
    init(buttonText: String) {
        self.buttonText = buttonText
    }
    
    var body: some View {
        VStack{
            Button(buttonText) {
                        print("Button pressed!")
                    }
                    .buttonStyle(BlackButton())
        }
    }
}

struct BlackButton: ButtonStyle {
    func makeBody(configuration: 
        
        Configuration) -> some View {
        configuration.label
            .padding().frame(maxWidth:350)
            .background(Color(red: 0, green: 0, blue: 0))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct WhiteButton: ButtonStyle {
    func makeBody(configuration: 
        
        Configuration) -> some View {
        configuration.label
            .padding().frame(maxWidth:350)
            .background(Color(red: 255, green: 255, blue: 255))
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ButtonView(buttonText: "Next")
}
