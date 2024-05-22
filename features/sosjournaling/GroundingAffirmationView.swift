//
//  GroundingAffirmationView.swift
//  actapp
//
//  Created by Channy Lim on 13/05/24.
//

import SwiftUI

struct GroundingAffirmationView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 17.5) {
                
                Spacer()
                
                Text("So notice there are difficult thoughts and feelings appearing...").font(.body).fontWeight(.semibold)
                VStack{
                    Text("Anxiety").font(.body).fontWeight(.bold).padding(.horizontal, 1)
                }
                
//                VStack() {
//                    Color.gray
//                }
//                .frame(width: 393, height: 465)
                
                Text("...and there is also a world around you that you can see and hear and touch and taste and smell.").font(.body).fontWeight(.bold).padding(.horizontal, 1)
                VStack{
                    Text("I refocused on the world around me and….").font(.body).fontWeight(.regular).multilineTextAlignment(.leading).padding(.horizontal, 1)
                }
                VStack{
                    Text("I see")/*.font(.title)*/.font(.system(size: 20)).fontWeight(.bold).multilineTextAlignment(.leading).padding(.horizontal, 1)
                }
                VStack{
                    Text("Water bottle, name card, food, IPad, Spoon").font(.body).fontWeight(.regular).multilineTextAlignment(.leading).padding(.horizontal, 1)
                }
                VStack{
                    Text("I hear")/*.font(.title)*/.font(.system(size: 20)).fontWeight(.bold).multilineTextAlignment(.leading).padding(.horizontal, 1)
                }
                VStack{
                    Text("Coffee machine, music, cuttlery clinking").font(.body).fontWeight(.regular).multilineTextAlignment(.leading).padding(.horizontal, 1)
                }
                VStack{
                    Text("I smell")/*.font(.title)*/.font(.system(size: 20)).fontWeight(.bold).multilineTextAlignment(.leading).padding(.horizontal, 1)
                }
                VStack{
                    Text("Ayam goreng").font(.body).fontWeight(.regular).multilineTextAlignment(.leading).padding(.horizontal, 1)
                }
                VStack{
                    Text("I touched")/*.font(.title)*/.font(.system(size: 20)).fontWeight(.bold).multilineTextAlignment(.leading).padding(.horizontal, 1)
                }
                VStack{
                    Text("Smooth").font(.body).fontWeight(.regular).multilineTextAlignment(.leading).padding(.horizontal, 1)
                }
                
                Spacer()
                Spacer()
                
                HStack {
//                    NavigationLink( destination:
//                                        GroundingRefocusTouchView()){
//                        Text("Back")
//                            .modifier(ButtonGray())
//                            .frame(maxWidth: 80)
//                    }
                    
                    //                Button("Next") {
                    //                    print("Button pressed!")
                    //                }
                    //                .buttonStyle(BlackButton())
                    //                .frame(maxWidth: .infinity)
                    NavigationLink( destination:
                                        GroundingNotice()){
                        Text("Finish")
                            .modifier(ButtonGreen())
                        
                    }
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    GroundingAffirmationView()
}
