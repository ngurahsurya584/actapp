//
//  MakingRoom - ImaginingYourPain.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct MakingRoom___ImaginingYourPain: View {
    var body: some View {
        NavigationStack{
            
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment: .leading, spacing: 8){
                    Text("MAKING ROOM FOR YOUR PAIN")
                        .font(.caption2).fontWeight(.semibold).foregroundColor(Color.gray)
                    Text("Draw your pain as the object that you’ve imagined")
                        .font(.title).fontWeight(.bold).foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                        .fill(Color.white)
                        .frame(width: 352, height: 466)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                Spacer()
                Spacer()
                Spacer()
                HStack {
                    // NEED TO FIX THE DESTINATION
                    NavigationLink( destination: BeingKind___Notice()){
                        Text("Back")
                            .modifier(ButtonGray())
                            .frame(width: 80)
                    }
                    NavigationLink( destination: BeingKind___InSession()){
                        Text("Finish")
                            .modifier(ButtonBlack())
                    }
                }
                HStack {
                    Button("Back") {
                        print("Button pressed!")
                    }
                    .buttonStyle(GrayButton())
                    
                    .frame(width: 80)
                    
                    Button("Finish") {
                        print("Button pressed!")
                    }
                    .buttonStyle(BlackButton())
                    
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    MakingRoom___ImaginingYourPain()
}
