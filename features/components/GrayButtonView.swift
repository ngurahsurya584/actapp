//
//  GrayButtonView.swift
//  actapp
//
//  Created by Channy Lim on 13/05/24.
//

import SwiftUI

struct GrayButtonView: View {
    let buttonText: String
    
    init(buttonText: String) {
        self.buttonText = buttonText
    }
    
    var body: some View {
        VStack{
            Button(buttonText) {
                        print("Button pressed!")
                    }
                    .buttonStyle(GrayButton())
        }
    }
}

struct GrayButton: ButtonStyle {
    func makeBody(configuration:
        
        Configuration) -> some View {
        configuration.label
            .padding().frame(maxWidth: .infinity)
            .background(Color(red: 242, green: 242, blue: 247))
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    GrayButtonView(buttonText: "Next")
}
