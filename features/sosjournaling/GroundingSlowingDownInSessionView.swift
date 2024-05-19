//
//  GroundingSlowingDownInSessionView.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 19/05/24.
//

import SwiftUI

struct GroundingSlowingDownInSessionView: View {
    let isSessionFinished = true
    
    var body: some View {

        NavigationStack{
            VStack {
                VStack {
                    VStack(spacing: 10) {
                        Text("Slow down and reconnect with your body")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        
                        Text("Slowly breath in")
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                    
                    if isSessionFinished {
//                        HStack {
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
//                            NavigationLink( destination:
//                                GroundingRefocusSightView()){
//                                Text("Next")
//                                    .modifier(ButtonWhite())
                                
//                            }
//                        }
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
    GroundingSlowingDownInSessionView()
}
