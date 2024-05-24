//
//  Onboarding-AllSetView.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 10/05/24.
//

import SwiftUI

struct OnboardingAllSetView: View {
    @AppStorage("isWelcomeScreenOver") var isWelcomeScreenOver = false
    @State private var changeSize = false
    var body: some View {
        NavigationStack{
            VStack {
                VStack(alignment: .center) {
                    Text("Start living by your ")
                        .font(.title).bold()
                    +
                    Text("values")
                        .font(.title).bold().italic()
                        .fontDesign( .serif)

                    Text("Enjoy your journey on becoming the person you want to be.")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.top, 0.05)
                }
                .padding(.bottom, 30)
                .multilineTextAlignment(.center)
                
                Spacer()
                Circle()
                    .fill(RadialGradient(
                        gradient: Gradient(colors: [.buttonAovStart,.buttonAovMiddle, .buttonAovStop, .clear]),
                        center: .center,
                        startRadius: 0,
                        endRadius: changeSize ? 200 : 160
                    ))
                    .onAppear{
                        withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)){
                            changeSize.toggle()
                        }
                    }
                Spacer()
                
                NavigationLink( destination: JournalingView()){
                    Text("Let's begin")
                        .modifier(ButtonWhite())
                    
                    
                }.simultaneousGesture(TapGesture().onEnded {
                    isWelcomeScreenOver = true
                })
                
                
            }
            .padding()
            .padding(.top, 20)
            .foregroundColor(.white)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    OnboardingAllSetView()
}
