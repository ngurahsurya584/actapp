//
//  Onboarding-ActIntroduction1View.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 09/05/24.
//

import SwiftUI

struct OnboardingFirstIntroView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("We’re here to help ")
                        .font(.title).bold().fontDesign(.rounded)
                    + Text("You")
                        .font(.title).bold().italic()
                        .fontDesign( .serif)
                    Spacer()
                    Text("Stress can happen to anyone and you are not alone. We will help you to learn and practice the skills for dealing with stress.")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                Spacer()
                Spacer()
                
                VStack{
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .fill(.gray)
                        .frame(width: 393, height: 484)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Spacer()
                Spacer()
                Spacer()
                
                //            Button("Next") {
                //                        print("Button pressed!")
                //                    }
                //                    .buttonStyle(BlackButton())
                NavigationLink( destination: Onboarding_ActIntroduction2View()){
                    Text("Next")
                        .modifier(ButtonBlack())
                    
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingFirstIntroView()
}
