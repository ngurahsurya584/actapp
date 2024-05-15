//
//  BeingKind - Finished.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct BeingKind___Finished: View {
    let isSessionFinished = true
    
    var body: some View {

        VStack {
            VStack {
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Being Kind to yourself")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .frame(width: .infinity ,alignment: .center)
                    Spacer()
                    Text("Feel the warmth flowing from your hand to your body")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
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
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                
                if isSessionFinished {
                    HStack {
                        Button("Back") {
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
    BeingKind___Finished()
}
