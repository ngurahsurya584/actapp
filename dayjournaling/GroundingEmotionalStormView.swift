//
//  GroundingEmotionalStormView.swift
//  actapp
//
//  Created by Channy Lim on 14/05/24.
//

import SwiftUI

struct GroundingEmotionalStormView: View {
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                Color.gray
            }
            .frame(width: 393, height: 724)  
            
            HStack {
                Button("Back") {
                    print("Button pressed!")
                }
                .buttonStyle(GrayButton())
                .frame(maxWidth: 80)
                
                Button("Next") {
                    print("Button pressed!")
                }
                .buttonStyle(BlackButton())
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    GroundingEmotionalStormView()
}
