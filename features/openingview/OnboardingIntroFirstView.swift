//
//  Onboarding-ActIntroduction2View.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 09/05/24.
//

import SwiftUI

struct OnboardingIntroFirstView: View {
    @State private var changeSize = false
    var body: some View {
        NavigationStack{
            VStack {
                VStack(alignment: .center) {
                    Text("Learn")
                        .font(.title).bold().italic()
                        .fontDesign( .serif)
                    +
                    Text(" to live with stress")
                        .font(.title).bold()
                    Text("Stress can happen to anyone and you are not alone. With grass, you will learn and practice the skills for dealing with stress.")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.top, 0.05)
                }
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

                NavigationLink( destination: OnboardingIntroSecondView()){
                    Text("Next")
                        .modifier(ButtonWhite())
                }
            }
            .padding()
            .padding(.top, 20)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .foregroundColor(.white)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    OnboardingIntroFirstView()
}
