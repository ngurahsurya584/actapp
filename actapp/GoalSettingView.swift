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
        GeometryReader(content: { geometry in
            VStack{
                Text("What do you wish to achieve with ").font(.largeTitle).bold()
                +
                Text("***Grass***")
                    .font(.largeTitle)
                    .fontDesign( .serif)
            }
            .padding()
        })
    }
}

#Preview {
    GoalSettingView()
}
