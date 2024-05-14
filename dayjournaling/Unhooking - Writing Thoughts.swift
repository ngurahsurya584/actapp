//
//  Unhooking - Writing Thoughts.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 13/05/24.
//

import SwiftUI

struct Unhooking___Writing_Thoughts: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
                .fill(Color.gray)
                .frame(width: 393, height: 274)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            VStack(alignment: .leading, spacing: 12){
                Text("NOTICE HOOKING FEELING OR THOUGHT")
                    .font(.caption2).fontWeight(.semibold).foregroundColor(Color.gray)
                Text("Here comes a thought…")
                    .font(.title2).fontWeight(.regular).foregroundColor(Color.black)
                Text("Write the unkind thoughts that pulled your attention away")
                    .font(.title).fontWeight(.bold).foregroundColor(Color.black)
                Text("e.g.: I remember that he did me wrong yesterday, I feel like I don’t deserve this, etc.")
                    .font(.body).fontWeight(.semibold).foregroundColor(Color.gray)
            }
            .padding(.horizontal)
            Spacer()
            
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(Color.black, lineWidth: 2)
//                .fill(Color.white)
//                .frame(width: 352, height: 194)
//                .frame(maxWidth: .infinity, alignment: .center)
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
                                .frame(width: 352, height:194)
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
                        .frame(width: 352, height: 194)
            HStack {
                Button("Back") {
                    print("Button pressed!")
                }
                .buttonStyle(GrayButton())
                
                .frame(width: 80)
                
                Button("Next") {
                    print("Button pressed!")
                }
                .buttonStyle(BlackButton())
                
            }
            .padding()
            
            Spacer() // Spacer ini akan menempatkan konten ke bagian atas layar
        }
        .ignoresSafeArea(.all) // Mengabaikan batas aman layar
    }
}

#Preview {
        Unhooking___Writing_Thoughts()
    }

