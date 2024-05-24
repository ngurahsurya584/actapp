//
//  JournalingNightCompletedView.swift
//  actapp
//
//  Created by Channy Lim on 23/05/24.
//

import SwiftUI

struct JournalingNightCompletedView: View {
    @State private var changeSize = false

    var body: some View {
        NavigationStack{
            VStack {
                VStack() {
                    Text("You’re doing well")
                        .font(.title).bold()
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
                
                Text("No matter how bad your situation, tiny little actions of kindness can make a difference. ")
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .font(.system(size: 21))
                    .padding(.bottom, 40)
                    .multilineTextAlignment(.center)
                
                NavigationLink( destination:JournalingView()){
                    Text("Close")
                        .modifier(ButtonWhiteTextBlack())
                }            }
            .padding()
            .padding(.top, 20)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .foregroundColor(.white)
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

#Preview {
    JournalingNightCompletedView()
}
