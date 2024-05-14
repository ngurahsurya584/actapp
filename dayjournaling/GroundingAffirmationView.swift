//
//  GroundingAffirmationView.swift
//  actapp
//
//  Created by Channy Lim on 13/05/24.
//

import SwiftUI

struct GroundingAffirmationView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 17.5) {
            Text("So notice there are difficult thoughts and feelings appearing...").font(.body).fontWeight(.semibold)
                        
            VStack() {
                Color.gray
            }
            .frame(width: 393, height: 465)
            
            Text("...and there is also a world around you that you can see and hear and touch and taste and smell.").font(.body).fontWeight(.bold).padding(.bottom, 5.5)
            
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
        }
        .padding()
    }
}

#Preview {
    GroundingAffirmationView()
}
