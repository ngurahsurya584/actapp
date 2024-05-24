//
//  GroundingSlowingDownView.swift
//  actapp
//
//  Created by Channy Lim on 13/05/24.
//

import SwiftUI

struct GroundingSlowingSessionFinishedView: View {
    let isSessionFinished = true
    
    var body: some View {

        NavigationStack{
            VStack {
                VStack {
                    VStack(spacing: 10) {
                        Text("Slowy breath in")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding(.top, 30)
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
            .background(RadialGradient(colors: [Color.stopGradient, Color.startGradient], center: .center, startRadius: 10, endRadius: 300))
        }
    }

}

#Preview {
    GroundingSlowingSessionFinishedView()
}
