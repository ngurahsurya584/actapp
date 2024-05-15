//
//  Transmission.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct Transmission: View {
    let isSessionFinished = true
    
    var body: some View {

        VStack {
            VStack {
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("You’re closer to reaching your values!")
                        .fontWeight(.bold)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .frame(width: .infinity ,alignment: .center)
                    Spacer()
                    Text("Up next: ")
                        .font(.title2)
                        .fontWeight(.regular)
                    +
                    Text("Being Kind")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Text("Visualizer here")
                    .fontWeight(.bold)
                    .italic()
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Text("No matter how bad your situation, tiny little actions of kindness can make a difference. Yet many of us are not kind to ourselves when we are in difficult situations. Let’s change that!")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .fontWeight(.regular)
                
                Spacer()
                Spacer()
                Spacer()
                
                
                if isSessionFinished {
                    HStack {
                        Button("Skip") {
                                    print("Button pressed!")
                                }
                        .buttonStyle(WhiteButton())
                        .frame(maxWidth: 80)

                        Button("Next") {
                                    print("Button pressed!")
                                }
                        .buttonStyle(WhiteButton())
                    }
                }
            }
            .padding()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity
        )
        .foregroundColor(.white)
        .background(.black)
    }

}

#Preview {
    Transmission()
}
