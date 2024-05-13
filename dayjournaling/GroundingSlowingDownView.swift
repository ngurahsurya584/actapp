//
//  GroundingSlowingDownView.swift
//  actapp
//
//  Created by Channy Lim on 13/05/24.
//

import SwiftUI

struct GroundingSlowingDownView: View {
    var body: some View {
        
        VStack {
            VStack(spacing: 10) {
                Text("Slow down and reconnect with your body")
                    .fontWeight(.bold)

                Text("Slowly breath in")
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.top, 20)

            Spacer()
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
    GroundingSlowingDownView()
}
