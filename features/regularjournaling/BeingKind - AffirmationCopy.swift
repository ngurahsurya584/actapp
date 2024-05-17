//
//  BeingKind - AffirmationCopy.swift
//  actapp
//
//  Created by Channy Lim on 15/05/24.
//

import SwiftUI

struct BeingKind___AffirmationCopy: View {
    
    @State private var isChecked = Array(repeating: false, count: 3)
    
    let values = ["Leave", "Change what can be changed, accept the pain that cannot be changed, and live by your values", "Give up and move away from your values"]
    
    var body: some View {
        NavigationStack{
            
            VStack() {
                Spacer()
                
                Text("Remember that there are three approaches to any difficult situation, you can decide what you want to do:").fontWeight(.semibold).font(.body)
                VStack(alignment: .leading){
                    ForEach(0..<isChecked.count, id: \.self) { index in
                        HStack {
                            HStack {
                                CheckBoxView(checked: self.$isChecked[index])
                                Text(self.values[index])
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255).opacity(0.29))
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                HStack {
                    Button("Back") {
                        print("Button pressed!")
                    }
                    .buttonStyle(GrayButton())
                    .frame(maxWidth: 80)
                    
                    Button("Next") {
                        print("Button pressed!")
                    }
                    .buttonStyle(BlackButton())
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    BeingKind___AffirmationCopy()
}
