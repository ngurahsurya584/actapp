//
//  PracticeView.swift
//  actapp
//
//  Created by Channy Lim on 12/05/24.
//

import SwiftUI

struct PracticeView: View {
    @State private var emotion: String = ""

    var body: some View {

        VStack {
            Text("NOTICE AND NAME")
            Text("A storm is brewing inside…")
            Text("Name the unkind emotions that you have")
            Text("Separate each feeling by space")
            TextField(
                "Stressed",
                text: $emotion
            )
            .padding()
            .overlay(VStack{Divider().offset(x: 0, y: 15)})
        }
        
        HStack {
            
        }
        
    }
}

#Preview {
    PracticeView()
}
