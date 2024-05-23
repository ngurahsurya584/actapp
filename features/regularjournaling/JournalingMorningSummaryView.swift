//
//  MorningJournalingSummaryView.swift
//  actapp
//
//  Created by Channy Lim on 23/05/24.
//

import SwiftUI

struct JournalingMorningSummaryView: View {
    let chosenThreeValues = ["Patience", "Creativity", "Hard Work"]
    let todo = "1. I will offer assistance to my colleagues with their work, especially the interns. \n2. I will strive for perfection in all of my work. \n3. I will try to come up with new solutions for each problem I’ve encountered today."
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0){
                
                Text("I WILL FOCUS ON THESE VALUES TODAY")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                    .padding(.bottom, 20)
                VStack{
                    HStack(spacing: 12) {
                        
                        ForEach(chosenThreeValues, id: \.self) { value in
                            Button(value) {
                                print("Button pressed!")
                            }
                            .buttonStyle(LinearGrayButtonSmall())
                        }
                        
                    }
                    .font(.callout)
                    .padding(.bottom, 40)
                    
                }
                
                Text("HERE IS WHAT I WILL DO")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                    .padding(.bottom, 20)
                
                Text(todo)
                
                Spacer()
                
                
                NavigationLink( destination: JournalingMorningTransmission()){
                    Text("Finish")
                        .modifier(ButtonYellow())
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 30)
            .frame(maxWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Summary")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
        }
    }
}


#Preview {
    JournalingMorningSummaryView()
}
