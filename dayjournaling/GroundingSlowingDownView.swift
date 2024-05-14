//
//  GroundingSlowingDownView.swift
//  actapp
//
//  Created by Channy Lim on 13/05/24.
//

import SwiftUI

struct GroundingSlowingDownView: View {
    let isSessionFinished = true

    var body: some View {

        VStack {
            VStack {
                VStack(spacing: 10) {
                    Text("Slow down and reconnect with your body")
                        .fontWeight(.bold)

                    Text("Slowly breath in")
                        .fontWeight(.bold)
                        .font(.title)
                }
                .padding(.top, 30)

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
    GroundingSlowingDownView()
}
