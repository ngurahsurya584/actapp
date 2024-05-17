//
//  Onboarding-AllSetView.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 10/05/24.
//

import SwiftUI

struct OnboardingAllSetView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("You’re all set!")
                        .font(.title).bold().fontDesign(.rounded)
                    Spacer()
                    Text("Enjoy this journey on learning how to what matters in times of stress.")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                Spacer()
                Spacer()
                
                VStack{
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .fill(.gray)
                        .frame(width: 393, height: 504)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Spacer()
                Spacer()
                Spacer()
                
//                Button("Let's begin") {
//                    print("Button pressed!")
//                }
//                .buttonStyle(BlackButton())
                NavigationLink( destination:
                    JournalingHomeView()){
                    Text("Let's begin")
                        .modifier(ButtonBlack())
                    
                }
                
                
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingAllSetView()
}
