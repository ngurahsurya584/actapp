//
//  BeingKind - Notice.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct BeingKind___Notice: View {
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
                    Text("NOTICE YOUR UNKIND THOUGHTS")
                        .font(.caption2).fontWeight(.semibold).foregroundColor(Color.gray)
                    Text("Choose an unkind thought about yourself")
                        .font(.title).fontWeight(.bold).foregroundColor(Color.black)
                    Text("e.g.: I’m a bad employee, I’m a weak boss, I can’t do my job right, etc.")
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
                        .frame(width: 352, height: 277)
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
                .frame(width: 352, height: 277)
                
                HStack {
                    // NEED TO FIX THE DESTINATION
                    NavigationLink( destination: BeingKind___Notice()){
                        Text("Skip")
                            .modifier(ButtonGray())
                            .frame(width: 80)
                    }
                    NavigationLink( destination: BeingKind___InSession()){
                        Text("Next")
                            .modifier(ButtonBlack())
                    }
                }
                .padding()
                
                Spacer() // Spacer ini akan menempatkan konten ke bagian atas layar
            }
            .ignoresSafeArea(.all) // Mengabaikan batas aman layar
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BeingKind___Notice()
}
