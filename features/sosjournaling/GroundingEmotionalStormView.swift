//
//  GroundingEmotionalStormView.swift
//  actapp
//
//  Created by Channy Lim on 14/05/24.
//

import SwiftUI

struct GroundingEmotionalStormView: View {
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing: 20) {
                    Color.gray
                }
                .frame(width: 393, height: 724)  
                
                HStack {
                    NavigationLink( destination:
                                        GroundingRefocusSightView()){
                        Text("Back")
                            .modifier(ButtonGray())
                            .frame(maxWidth: 80)
                    }
                    
//                    Button("Next") {
//                        print("Button pressed!")
//                    }
//                    .buttonStyle(BlackButton())
//                    .frame(maxWidth: .infinity)
                    NavigationLink( destination:
                        GroundingBreathingDownView()){
                        Text("Next")
                            .modifier(ButtonBlack())
                        
                    }
                }
                .padding()
                .navigationBarBackButtonHidden(true)
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    GroundingEmotionalStormView()
}
