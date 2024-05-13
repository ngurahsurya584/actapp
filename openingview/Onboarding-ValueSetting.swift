//
//  Onboarding-ValueSetting.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 10/05/24.
//

import SwiftUI

struct Onboarding_ValueSetting: View {
    
    @State private var isChecked = Array(repeating: false, count: 10) // Array untuk menyimpan status setiap item
    @State private var isStarChecked = Array(repeating: false, count: 10) // Array untuk menyimpan status bintang

    let values = ["Persistent", "Hard work", "Continued development", "Supportive", "Career progression", "Customer service", "Cooperation", "Creativity", "Collaboration", "Patient"]

    var body: some View {
        
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            VStack(alignment: .leading) {
                Text("Let’s explore your ")
                    .font(.title).bold().fontDesign(.rounded)
                + Text("values!")
                    .font(.title).bold().italic()
                    .fontDesign( .serif)
                Text("Values describe the sort of person you want to be; how you want to treat yourself and others and the world around you. Choose the values that stand out to you the most!")
                    .font(.body)
                    .fontWeight(.semibold)
            }
            
            VStack{
                ForEach(0..<isChecked.count, id: \.self) { index in
                    HStack {
                        HStack {
                            CheckBoxView(checked: self.$isChecked[index]) // CheckBox untuk setiap item
                            Text(self.values[index])
                                .font(.body)
                                .fontWeight(.light)
                        }
                        Spacer()
                        StarView(checked: self.$isStarChecked[index]) // Bintang untuk setiap item
                        
                    }
                    Spacer()
                    Spacer()
                }
            }

            Button("Next") {
                print("Button pressed!")
            }
            .buttonStyle(BlackButton())
            
        }
        .padding()
    }
}

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.circle.fill" : "circle") // Menggunakan checkmark.circle.fill atau circle sesuai status
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .imageScale(.large)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct StarView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "star.fill" : "star") // Menggunakan star.fill atau star sesuai status
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .imageScale(.large)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

#Preview {
        Onboarding_ValueSetting()
    }


