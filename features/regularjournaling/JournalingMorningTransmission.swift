//
//  Transmission1.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 18/05/24.
//

import SwiftUI

struct JournalingMorningTransmission: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                VStack() {
                    Text("Great job!")
                        .font(.title).bold()
                }
                .multilineTextAlignment(.center)
                
                Spacer()
                Image("dummy")
                Spacer()
                
                Text("Planning ahead will increase the likeliness of reaching your values.")
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .font(.system(size: 21))
                    .padding(.bottom, 40)
                    .multilineTextAlignment(.center)
                
                NavigationLink( destination:JournalingView()){
                    Text("Close")
                        .modifier(ButtonWhiteTextBlack())   
                }
            }
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
    JournalingMorningTransmission()
}
