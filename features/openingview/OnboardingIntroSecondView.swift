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
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("What does ")
                        .font(.title).bold().fontDesign(.rounded)
                    + Text("hooked ")
                        .font(.title).bold().italic()
                        .fontDesign( .serif)
                    + Text("mean?")
                        .font(.title).bold().fontDesign(.rounded)
                    Spacer()
                    Text("When something is on a hook, it cannot get away. The hook traps it. In the same way, we can get hooked by our difficult thoughts and feelings that they pull us away from our “values”.")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                Spacer()
                Spacer()
                
                VStack{
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .fill(.gray)
                        .frame(width: 393, height: 438)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Spacer()
                Spacer()
                Spacer()
                
                NavigationLink( destination: OnboardingValueSettingView()){
                    Text("Next")
                        .modifier(ButtonBlack())
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingIntroSecondView()
}
