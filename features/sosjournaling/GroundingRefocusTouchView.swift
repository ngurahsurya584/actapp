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
    
    var body: some View {
        NavigationStack{
            VStack {
                Rectangle()
                    .stroke(Color.black, lineWidth: 2)
                    .fill(Color.gray)
                    .frame(width: 393, height: 274)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                VStack(alignment: .leading, spacing: 12) {
                    Text("REFOCUS AND ENGAGE")
                        .font(.caption2).fontWeight(.semibold).foregroundColor(Color.gray)
                    Text("Describe what you want to refocus your attention on…")
                        .font(.title).fontWeight(.bold).foregroundColor(Color.black)
                    Text("e.g.:I’m writing a proposal for my manager to review.")
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
                        .frame(width: 352, height: 147)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .focused($isFocused)
                        .onTapGesture {
                            isFocused = true
                        }
                    
                }
                .frame(width: 352, height: 147)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                HStack {
//                    NavigationLink( destination:
//                                        GroundingRefocusSightView()){
//                        Text("Back")
//                            .modifier(ButtonGray())
//                            .frame(maxWidth: 80)
//                    }
//                    
//                    .frame(width: 80)
                    
                    //                Button("Next") {
                    //                    print("Button pressed!")
                    //                }
                    //                .buttonStyle(BlackButton())
                    NavigationLink( destination:
                                        GroundingAffirmationView()){
                        Text("Finish")
                            .modifier(ButtonGreen())
                        
                    }
                    
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                
                Spacer()
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    GroundingRefocusTouchView()
}
