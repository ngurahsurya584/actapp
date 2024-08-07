//
//  Unhooking - Affirmation.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 14/05/24.
//

import SwiftUI

struct Unhooking___Affirmation: View {
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Spacer()
                VStack{
                    Text("It is natural to have difficult feeling and thoughts to appear when we are stressed.")
                        .font(.body).fontWeight(.semibold).foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack{
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .fill(.gray)
                        .frame(width: 393, height: 447)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Spacer()
                VStack{
                    Text("After we have noticed and named, we can refocus on the world around us. We engage in life by noticing what we can see, smell, taste, hear, and touch.")
                        .font(.body).fontWeight(.semibold).foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                HStack {
                    NavigationLink( destination:
                                        Unhooking___Refocusing_and_Engaging()){
                        Text("Back")
                            .modifier(ButtonGray())
                            .frame(maxWidth: 80)
                    }
                    NavigationLink( destination:
                                        Unhooking___Affirmation()){
                        Text("Finish")
                            .modifier(ButtonBlack())
                        
                    }
                    
                }
                
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Unhooking___Affirmation()
}
