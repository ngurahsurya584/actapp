//
//  GoalSettingView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 07/05/24.
//

import SwiftUI

let questionName:String = ""

struct GoalSettingView: View {
    
    var body: some View {
        VStack{
            HStack{
                RoundedRectangle(cornerRadius: 25)
                                .fill(.black)
                                .frame(width: 150, height: 10).padding(.trailing, 20)
                
                RoundedRectangle(cornerRadius: 25)
                                .fill(.gray )
                                .frame(width: 150, height: 10)
            }
            Text("What do you wish to achieve with ").font(.largeTitle).bold()
                +
            Text("Grass")
                .font(.largeTitle)
                .fontDesign( .serif).bold().italic()
            Spacer()
        }.padding()
           
           
    }
}

#Preview {
    GoalSettingView()
}
