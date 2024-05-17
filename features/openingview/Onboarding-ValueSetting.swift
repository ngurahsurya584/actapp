//
//  Onboarding-ValueSetting.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 10/05/24.
//

import SwiftUI

struct Onboarding_ValueSetting: View {
    
    
    let values = ["Persistent", "Hard work", "Continued development", "Supportive", "Career progression", "Customer service", "Cooperation", "Creativity", "Collaboration", "Patient"]
    @State var isChecked: [Bool]

        init() {
            _isChecked = State(initialValue: Array(repeating: false, count: values.count))
        }
    
//    @State private var isChecked = Array(repeating: false, count: values.count) // Array untuk menyimpan status setiap item

    
    
    var body: some View {
        
        NavigationStack{
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
                        .fontWeight(.semibold).padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }.padding(.bottom, 30)
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ForEach(0..<isChecked.count, id: \.self) { index in
                            VStack{
                                HStack {
                                    HStack {
                                        CheckBoxView(checked: self.$isChecked[index]) // CheckBox untuk setiap item
                                        Text(self.values[index])
                                            .font(.body)
                                            .fontWeight(.light)
                                    }
                                    Spacer()
                                    
                                }
                            }
                            Divider()
                            Spacer()
                        }
                        
                    }
                }.padding(.bottom, 30)
                
                Spacer()
                Spacer()
               
                NavigationLink( destination: Onboarding_ReminderSetting()){
                    Text("Next")
                        .modifier(ButtonBlack())
                    
                }
                    
                
                
                
            }
            .padding()
        }
        
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

#Preview {
        Onboarding_ValueSetting()
    }


