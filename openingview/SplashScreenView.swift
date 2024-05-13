//
//  SplashScreenView.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 09/05/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack{
            Circle()
                .stroke(.black, lineWidth: 2)
                .fill(.gray)
                .frame(width: 231, height: 230)
            Text("Grass")
                .font(.largeTitle).bold().italic()
                .fontDesign( .serif)
            
        }
        .padding()
    }
}

#Preview {
    SplashScreenView()
}
