//
//  InsightsDetailView.swift
//  actapp
//
//  Created by Channy Lim on 18/05/24.
//

import SwiftUI

struct InsightsDetailView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing: 0) {
                    Divider()
                        .frame(width: UIScreen.main.bounds.width * 1)
                        .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                    
                    VStack(spacing: 0) {
                        VStack(spacing:0) {
                            Image(systemName: "tree.fill")
                                .font(.system(size: 30))
                            Text("GROUNDING")
                        }
                        .padding(.bottom, 40)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            VStack(alignment: .leading) {
                                Text("I HAD UNKIND EMOTIONS FEELING……")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 14))
                                
                                Text("Stressed, Anxious")
                                    .font(.system(size: 20))
                            }
                            .padding(.bottom, 10)
                            
                            VStack(alignment: .leading) {
                                Text("I SAW……")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 14))
                                
                                Text("Table, Chair, Monitor, Laptop, Keyboard")
                                    .font(.system(size: 20))
                            }
                            .padding(.bottom, 10)
                            
                            VStack(alignment: .leading) {
                                Text("I HEARD……")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 14))
                                
                                Text("Coffee Grounds")
                                    .font(.system(size: 20))
                            }
                            .padding(.bottom, 10)
                            
                            VStack(alignment: .leading) {
                                Text("I TOUCHED……")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 14))
                                
                                Text("Warm, smooth to the touch, plasticky, bumpy at some areas, rounded")
                                    .font(.system(size: 20))
                            }
                            .padding(.bottom, 10)
                            
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                    .background(
                        Rectangle()
                            .fill(Color(red: 255/255, green: 255/255, blue: 255/255))
                            .frame(width: UIScreen.main.bounds.width * 1)
                    )
                    .frame(width: UIScreen.main.bounds.width * 0.88, alignment: .leading)
                    
                    VStack(spacing: 0) {
                        VStack(spacing:0) {
                            Image(systemName: "heart.text.square.fill")
                                .font(.system(size: 30))
                            Text("JOURNAL")
                        }
                        .padding(.bottom, 40)
                        
                        Text("ACTING ON YOUR VALUES")
                            .foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                            .fontWeight(.bold)
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 16)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            VStack(alignment: .leading) {
                                Text("I DEMONSTRATED MY VALUE OF……")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 14))
                                
                                Text("Attentiveness")
                                    .font(.system(size: 20))
                            }
                            .padding(.bottom, 10)
                            
                            VStack(alignment: .leading) {
                                Text("WHAT I DID TODAY……")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 14))
                                
                                Text("This morning, I finished the proposal that my manager asked and got praised for my meticulous writing")
                                    .font(.system(size: 20))
                            }
                            .padding(.bottom, 10)
                            
                            VStack(alignment: .leading) {
                                Text("I WANT TO IMPROVE ON……")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 14))
                                
                                Text("Patience")
                                    .font(.system(size: 20))
                            }
                            .padding(.bottom, 10)
                            
                            VStack(alignment: .leading) {
                                Text("THIS IS MY GAMEPLAN……")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 14))
                                
                                Text("I will take 5 repetions of long breaths whilst waiting for my morning coffee to be made")
                                    .font(.system(size: 20))
                            }
                            .padding(.bottom, 10)
                            
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                    .background(
                        Rectangle()
                            .fill(Color(red: 216/255, green: 216/255, blue: 216/255))
                            .opacity(0.2)
                            .frame(width: UIScreen.main.bounds.width * 1)
                    )
                    .frame(width: UIScreen.main.bounds.width * 0.88, alignment: .leading)
                }
                .foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("May 14, 2024")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    InsightsDetailView()
}
