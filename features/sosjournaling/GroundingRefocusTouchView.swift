//
//  GroundingRefocusTouchView.swift
//  actapp
//
//  Created by Channy Lim on 13/05/24.
//

import SwiftUI

struct GroundingRefocusTouchView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    @State private var changeSize = false
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 70 : 100
                        ))
                        .offset(y:80)
                        
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 30 : 50
                        ))
                        .offset(x:150, y:150)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 70 : 100
                        ))
                        .offset(x:-200, y:130)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 20 : 30
                        ))
                        .offset(x:-120, y:-10)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 30 : 50
                        ))
                        .offset(x:150, y:-10)
                }
                .offset(y:-80)
                .onAppear{
                    withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)){
                        changeSize.toggle()
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("REFOCUS AND ENGAGE")
                        .font(.caption2).fontWeight(.semibold).foregroundColor(Color.gray)
                    Text("What will you refocus on now?")
                        .font(.title).fontWeight(.bold).foregroundColor(Color.white)
                    Text("e.g.:I want to refocus on writing the project proposal for my manager to review.")
                        .font(.body).fontWeight(.semibold).foregroundColor(Color.gray)
                }
                .padding(.horizontal)
                
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text("I want to refocus on ")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                            .zIndex(1)
                    }
                    
                    TextEditor(text: $text)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                        .frame(width: 352, height: 300)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(LinearGradient(
                                    gradient: Gradient(colors: [.white, .middleGradient, .strokeGradient]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing), lineWidth: 1)
                                .fill(.fillTextEditor)
                        )
                        .focused($isFocused)
                        .onTapGesture {
                            isFocused = true
                        }
                    
                }
                .frame(width: 352, height: 300)
                
                Spacer()
                
                HStack {
                    NavigationLink( destination:
                                        GroundingAffirmationView()){
                        Text("Finish")
                            .modifier(ButtonNext())
                        
                    }
                    
                }
                .padding()
                .padding(.bottom, 20)
            }
            
        }
        .ignoresSafeArea(.all)
        
    }
}

#Preview {
    GroundingRefocusTouchView()
}
