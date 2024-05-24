//
//  CobaInsightsDetailView.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 24/05/24.
//

import SwiftUI

struct CobaInsightsDetailView: View {
    let chosenThreeValuesMorning = ["Patience", "Creativity", "Hard Work"]
    let todoMorning = "1. I will offer assistance to my colleagues with their work, especially the interns. \n2. I will strive for perfection in all of my work. \n3. I will try to come up with new solutions for each problem I’ve encountered today."
    
    let chosenThreeValuesNight = ["Patience", "Creativity", "Hard Work"]
    let todoNight = "1. I offered assistance to my colleagues with their work, especially the interns. \n2. I strived for perfection in all of my work. \n3. I came up with new solutions for each problem I’ve encountered today."
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("☀️ Morning.")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .foregroundStyle(Color(red: 255/255, green: 199/255, blue: 61/255))
                    Spacer()
                    Spacer()
                    VStack{
                        
                        Text("I WILL FOCUS ON THESE VALUES TODAY")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                            .padding(.bottom, 20)
                        
                        VStack {
                            HStack(spacing: 12) {
                                
                                ForEach(chosenThreeValuesMorning, id: \.self) { value in
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
                        
                        Text(todoMorning)
                            .foregroundStyle(Color.white)
                            .padding()
                        Spacer()
                        Spacer()
                        Rectangle()
                            .frame(width: 393, height: 1)
                            .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        Text("🌙 Night.")
                            .font(.title)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                            .foregroundStyle(Color(red: 178/255, green: 219/255, blue: 255/255))
                        Spacer()
                        Spacer()
                        VStack{
                            
                            Text("I WILL FOCUS ON THESE VALUES TODAY")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                                .padding(.bottom, 20)
                            
                            VStack {
                                HStack(spacing: 12) {
                                    
                                    ForEach(chosenThreeValuesNight, id: \.self) { value in
                                        Button(value) {
                                            print("Button pressed!")
                                        }
                                        .buttonStyle(LinearGrayButtonSmallTextPurple())
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
                            
                            Text(todoNight)
                                .foregroundStyle(Color.white)
                                .padding()
                        }
                        
                        
                    }
                    
                }
                 // Memberikan warna background hitam pada tata letak utama
            }
            .padding()
            .background(Color.black)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("May 14, 2024")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    CobaInsightsDetailView()
}

