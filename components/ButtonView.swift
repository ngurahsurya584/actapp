//
//  ButtonView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 07/05/24.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack{
            Button("Press Me") {
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

#Preview {
    ButtonView()
}
