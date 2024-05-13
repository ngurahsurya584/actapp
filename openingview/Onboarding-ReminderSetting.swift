//
//  Onboarding-ReminderSetting.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 10/05/24.
//

import SwiftUI

struct Onboarding_ReminderSetting: View {
    
    @State private var Morning = Date.now
    @State private var Night = Date.now
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            VStack(alignment: .leading) {
                Text("Practice makes ")
                    .font(.title).bold().fontDesign(.rounded)
                + Text("perfect")
                    .font(.title).bold().italic()
                    .fontDesign( .serif)
                Spacer()
                Text("Dealing with difficult thoughts and emotions is not easy. But every little bit of practice we do will come a long way. So let’s set a time to practice managing your stress!")
                    .font(.body)
                    .fontWeight(.bold)
            }
            Spacer()
            Spacer()
            Text ("MORNING")
                .font(.callout).fontDesign(.default)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack{
                
                DatePicker("", selection: $Morning, displayedComponents: .hourAndMinute).datePickerStyle(.wheel).labelsHidden()
                    .frame(width: 296, height: 185)
            
            }
            Spacer()
            Spacer()
            Text ("NIGHT")
                .font(.callout).fontDesign(.default)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack{
                DatePicker("", selection: $Night, displayedComponents: .hourAndMinute).datePickerStyle(.wheel).frame(width: 296, height: 185)
                
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Button("Next") {
                        print("Button pressed!")
                    }
                    .buttonStyle(BlackButton())
        }
        .padding()
    }
}

#Preview {
    Onboarding_ReminderSetting()
}
