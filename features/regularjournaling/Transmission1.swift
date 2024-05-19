//
//  Transmission1.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 18/05/24.
//

import SwiftUI

struct Transmission1: View {
    let isSessionFinished = true
    
    var body: some View {

        NavigationStack{
            VStack {
                VStack {
                    VStack{
//                        Text("Slow down and reconnect with your body")
//                            .font(.system(size: 18))
//                            .fontWeight(.semibold)
                        
                        Text("You’re closer to reaching your values!")
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                    VStack{
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .foregroundStyle(Color(red: 48/255, green: 153/255, blue: 117/255))
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                    }
                    VStack{
                        Text("10 day streak")
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    Spacer()
                    VStack{
                        Text("No matter how bad your situation, tiny little actions of kindness can make a difference. Yet many of us are not kind to ourselves when we are in difficult situations. Let’s change that!")
                            .fontWeight(.regular)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    if isSessionFinished {
                        HStack {
//                            NavigationLink( destination:
//                                                GroundingRefocusSightView()){
//                                Text("Back")
//                                    .modifier(ButtonWhite())
//                                    .frame(maxWidth: 80)
//                            }
                            
//                            Button("Next") {
//                                print("Button pressed!")
//                            }
//                            .buttonStyle(WhiteButton())
                            NavigationLink( destination:
                                GroundingRefocusSightView()){
                                Text("Close")
                                    .modifier(ButtonWhite())
                                
                            }
                        }
                    }
                }
                .padding()
                .navigationBarBackButtonHidden(true)
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
    Transmission1()
}
