//
//  TimeSettingView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 07/05/24.
//

import SwiftUI
import UIKit

struct TimeSettingView: View {
    @State private var timeRemind = Date.now

    
    var body: some View {
        VStack{
            HStack{
                RoundedRectangle(cornerRadius: 25)
                                .fill(.black)
                                .frame(width: 150, height: 10).padding(.trailing, 20)
                
                RoundedRectangle(cornerRadius: 25)
                                .fill(.gray )
                                .frame(width: 150, height: 10)
            }.padding(.bottom, 50)
            
            Text("When can ").font(.largeTitle).bold()
            +
            Text("***Grass*** ")
                .font(.largeTitle)
                .fontDesign( .serif)
            +
            Text("nudge you").font(.largeTitle).bold()
                DatePicker("",selection: $timeRemind, displayedComponents: .hourAndMinute).datePickerStyle(.wheel).labelsHidden().padding(.top, 50).scaleEffect(1.2)
                          
            Spacer()
            Button("Next") {
                        print("Button pressed!")
                    }
                    .buttonStyle(BlackButton())
            
        }.padding()
    }
}


#Preview {
    TimeSettingView()
}
