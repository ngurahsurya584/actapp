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
            Button("Press me") {
                        print("Button pressed!")
                    }
                    .buttonStyle(GrayButton())
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

struct BlackButtonSmall: ButtonStyle {
    func makeBody(configuration:
        
        Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 10)
            .fontWeight(.bold)
            .frame(height: 30)
            .background(Color(red: 0, green: 0, blue: 0))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}

struct WhiteButton: ButtonStyle {
    func makeBody(configuration:
        
        Configuration) -> some View {
        configuration.label
            .padding().frame(maxWidth: .infinity)
            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct WhiteButtonSmall: ButtonStyle {
    func makeBody(configuration:
        
        Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 10)
            .fontWeight(.bold)
            .frame(height: 30)
            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

struct GrayButton: ButtonStyle {
    func makeBody(configuration:
        
        Configuration) -> some View {
        configuration.label
            .padding().frame(maxWidth:350)
            .background(Color(red: 242/255, green: 242/255, blue: 247/255))
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


struct ButtonBlack: ViewModifier{
    
    func body(content: Content) -> some View{
        content
            .foregroundStyle(.white)
            .frame(maxWidth:.infinity, maxHeight:48)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ButtonView()
}
