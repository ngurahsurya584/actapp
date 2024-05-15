//
//  ActingOnYourValues - Default.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct ActingOnYourValues___Default: View {
    var body: some View {
        VStack{
            Text("Let’s reflect on your day")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Which value(s) did you demonstrate today that you’re proud of?")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            
            
            
            Text("Which value(s) do you want to focus on improving tomorrow?")
                .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    ActingOnYourValues___Default()
}
