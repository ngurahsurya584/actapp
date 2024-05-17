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
        
        NavigationStack{
            
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
                            NavigationLink( destination: BeingKind___Notice()){
                                Text("Back")
                                    .modifier(ButtonWhite())
                                    .frame(width: 80)
                            }
                            NavigationLink( destination: BeingKind___Affirmation()){
                                Text("Next")
                                    .modifier(ButtonWhite())
                            }
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
}
#Preview {
    BeingKind___Finished()
}
