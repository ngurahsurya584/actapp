//
//  Onboarding-ActIntroduction2View.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 09/05/24.
//

import SwiftUI

struct OnboardingIntroFirstView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("Stress is ")
                        .font(.title).bold().fontDesign(.rounded)
                    + Text("normal")
                        .font(.title).bold().italic()
                        .fontDesign( .serif)
                    Text("Stress can happen to anyone and you are not alone. We will help you to learn and practice the skills for dealing with stress.")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.top, 0.05)
                }
                Spacer()
                Spacer()
                
                VStack{
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .fill(.gray)
                        .frame(width: 393, height: 462)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Spacer()
                Spacer()
                Spacer()
                
                NavigationLink( destination: OnboardingIntroSecondView()){
                    Text("Next")
                        .modifier(ButtonBlack())
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingIntroFirstView()
}
