//
//  Transmission - 2.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct Transmission___2: View {
    let isSessionFinished = true
    
    var body: some View {

        VStack {
            VStack {
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("One more step! You got  this ❤️")
                        .fontWeight(.bold)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Text("Up next: ")
                        .font(.title2)
                        .fontWeight(.regular)
                    +
                    Text("Making Room")
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
                
                Text("Our thoughts and feelings are like the weather. We can learn to be like the sky, and make room for the “bad weather” of our difficult thoughts and feelings without being hurt by it.")
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
    Transmission___2()
}
