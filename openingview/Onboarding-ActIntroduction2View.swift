//
//  Onboarding-ActIntroduction2View.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 09/05/24.
//

import SwiftUI

struct Onboarding_ActIntroduction2View: View {
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
                    Spacer()
                    Text("Stress is often accompanied by powerful thoughts and feelings and that’s normal. But problems can occur if we get “hooked” by them.")
                        .font(.body)
                        .fontWeight(.semibold)
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
                
                NavigationLink( destination: Onboarding_ActIntroduction3View()){
                    Text("Next")
                        .modifier(ButtonBlack())
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    Onboarding_ActIntroduction2View()
}
