//
//  CardsAllFilledView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 12/05/24.
//

import SwiftUI

struct CardsAllFilledView: View {
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    Spacer().frame(height: 40)
                    HStack{
                        Text("My Value").font(.largeTitle).bold().padding(.horizontal)
                        Spacer().frame(width: 150)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Add >").foregroundStyle(.black).fontWeight(.semibold)
                        })
                    }
                    
                    Spacer()
                    
                    Text("Remember what kind of person you want to be").font(.caption).foregroundStyle(.gray).padding(.trailing, 75)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing:20){
                            Spacer().frame(width: 0)
                            ZStack{
                                Button(action:{
                                    print("tapped")
                                }){
                                    VStack{
                                        Spacer()
                                        Text("Kind").foregroundStyle(.black).fontWeight(.semibold)
                                        Text("I want to be kinder to myself and other people").font(.caption).multilineTextAlignment(.center).foregroundStyle(.gray)
                                    }
                                }.buttonStyle(CardButton())
                                
                            }
                            
                            ZStack{
                                Button(action:{
                                    print("tapped")
                                }){
                                    VStack{
                                        Spacer()
                                        Text("Kind").foregroundStyle(.black).fontWeight(.semibold)
                                        Text("I want to be kinder to myself and other people").font(.caption).multilineTextAlignment(.center).foregroundStyle(.gray)
                                    }
                                }.buttonStyle(CardButton())
                                
                            }
                            
                        }
                    }
                    
                    Spacer().frame(height:20)
                    
                    
                    HStack{
                        Text("My Hooks").font(.largeTitle).bold().padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Spacer().frame(width: 140)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Add >").foregroundStyle(.black).fontWeight(.semibold)
                        })
                    }
                    Spacer()
                    
                    Text("Learn to stop struggling and start living with your pain").font(.caption).foregroundStyle(.gray).padding(.trailing, 45)
                    
                    Spacer()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing:20){
                            Spacer().frame(width: 0)
                            ZStack{
                                Button(action:{
                                    print("tapped")
                                }){
                                    VStack{
                                        Spacer()
                                        Text("Anger").foregroundStyle(.black).fontWeight(.semibold)
                                        Text("Scalding hot, dense, red bubble in my chest").font(.caption).multilineTextAlignment(.center).foregroundStyle(.gray)
                                    }
                                }.buttonStyle(CardButton())
                                
                            }
                            
                            ZStack{
                                Button(action:{
                                    print("tapped")
                                }){
                                    VStack{
                                        Spacer()
                                        Text("Anger").foregroundStyle(.black).fontWeight(.semibold)
                                        Text("Scalding hot, dense, red bubble in my chest").font(.caption).multilineTextAlignment(.center).foregroundStyle(.gray)
                                    }
                                }.buttonStyle(CardButton())
                                
                            }
                            
                        }
                    }
                    
                    Spacer().frame(height:20)
                    
                    HStack{
                        Spacer()
                        Text("My Technique").font(.largeTitle).bold()
                        Spacer().frame(width: 150)
                    }
                    
                    Spacer()
                    
                    Text("Find what helps you deal with difficult situations").font(.caption).foregroundStyle(.gray).padding(.trailing, 70)
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing:20){
                            Spacer().frame(width: 0)
                            ZStack{
                                Button(action:{
                                    print("tapped")
                                }){
                                    VStack{
                                        Spacer()
                                        Text("Grounding").foregroundStyle(.black).fontWeight(.semibold)
                                        Text("Scalding hot, dense, red bubble in my chest").font(.caption).multilineTextAlignment(.center).foregroundStyle(.gray)
                                    }
                                }.buttonStyle(CardButton())
                                
                            }
                            
                            ZStack{
                                Button(action:{
                                    print("tapped")
                                }){
                                    VStack{
                                        Spacer()
                                        Text("Unhooking").foregroundStyle(.black).fontWeight(.semibold)
                                        Text("Scalding hot, dense, red bubble in my chest").font(.caption).multilineTextAlignment(.center).foregroundStyle(.gray)
                                    }
                                }.buttonStyle(CardButton())
                                
                            }
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Cards")
        }
    }
}

#Preview {
    CardsAllFilledView()
}
