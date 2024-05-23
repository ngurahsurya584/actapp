//
//  Onboarding-ActIntroduction3View.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 10/05/24.
//

import SwiftUI

struct OnboardingIntroSecondView: View {
    var body: some View {
        NavigationStack{
            VStack {
                VStack(alignment: .center) {
                    Text("Backed by ")
                        .font(.title).bold()
                    +
                    Text("science")
                        .font(.title).bold().italic()
                        .fontDesign( .serif)
                    Text("Grass is using the Acceptance and Commitment Training (ACT), which is proven to be effective in managing stress by experts.")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.top, 0.05)
                }
                .multilineTextAlignment(.center)

                Spacer()
                Image("dummy")
                Spacer()
                
                NavigationLink( destination: OnboardingValueSettingView()){
                    Text("Next")
                        .modifier(ButtonWhite())
                }
            }
            .padding()
            .padding(.top, 20)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    OnboardingIntroSecondView()
}
