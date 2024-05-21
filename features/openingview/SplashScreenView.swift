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
            Image("logo")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    SplashScreenView()
}
