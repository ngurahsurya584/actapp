//
//  Unhooking - Refocusing and Engaging.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 14/05/24.
//

import SwiftUI

struct Unhooking___Refocusing_and_Engaging: View {
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
                    Text("Refocus on what you’re doing and engage fully")
                        .font(.title).fontWeight(.bold).foregroundColor(Color.black)
                    Text("e.g.: I am noticing feelings of anger but I choose to act on my value of caring by engaging and paying attention to my family.")
                        .font(.body).fontWeight(.semibold).foregroundColor(Color.gray)
                }
                .padding(.horizontal)
                Spacer()
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text("Enter text here...")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                            .zIndex(1)
                    }
                    
                    TextEditor(text: $text)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                        .frame(width: 352, height: 255)
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
                .frame(width: 352, height: 255)
                
                HStack {
                    NavigationLink( destination:
                                        Unhooking___Naming_Pain()){
                        Text("Back")
                            .modifier(ButtonGray())
                            .frame(maxWidth: 80)
                    }
                    
                    //                Button("Next") {
                    //                    print("Button pressed!")
                    //                }
                    //                .buttonStyle(BlackButton())
                    NavigationLink( destination:
                        Unhooking___Affirmation()){
                        Text("Next")
                            .modifier(ButtonBlack())
                        
                    }
                    
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                
                Spacer() // Spacer ini akan menempatkan konten ke bagian atas layar
            }
            .ignoresSafeArea(.all) // Mengabaikan batas aman layar
        }
    }
}

#Preview {
    Unhooking___Refocusing_and_Engaging()
}
