//
//  Today - Night.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct Today___Night: View {
    let name = "Jennie"
    let isFinishedPractice = true

    var body: some View {
        let ctaButtonText = isFinishedPractice ? "Start reflection" : "Start practice"
        
        VStack(spacing: 20) {
            VStack(spacing: 20) {
                Color.gray
            }
            .frame(width: 393, height: 295)

            VStack(alignment: .leading, spacing: 8) {
                Text("Hi (name),")
                    .font(.title2)

                Text("How was your day?")
                    .font(.title)
                    .fontWeight(.semibold)

                HStack{
                    PracticeCardView(practiceHeading: "TONIGHT’S ROUTINE", titleText: "Acting on your values", subtitleText: "3 mins", descText: "Practice to slow down and engage with the world.")
                        .padding(.top, 12)
                }

                PracticeCardView(practiceHeading: "TODAY’S CHALLENGE", titleText: "Spreading Kindness", subtitleText: "Match with your value: Kind", descText: "Practice to slow down and engage with the world.")
                .padding(.top, 12)
                
                Button("\(ctaButtonText)") {
                            print("Button pressed!")
                        }
                .buttonStyle(BlackButton())
                .padding(.top, 12)
            }
            .padding()
            
            Spacer()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    Today___Night()
}
