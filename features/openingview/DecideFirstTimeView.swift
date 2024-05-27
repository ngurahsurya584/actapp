//
//  DecideFirstTimeView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 17/05/24.
//

import SwiftUI

struct DecideFirstTimeView: View {
    @AppStorage("isWelcomeScreenOver") var isWelcomeScreenOver = false
    @State var checkWelcomeScreen: Bool = false
    var body: some View {
        VStack {
                    if checkWelcomeScreen {
                        MainView()
                    } else {
                        OnboardingIntroFirstView()
                    }
                }
                .onAppear {
                    checkWelcomeScreen = isWelcomeScreenOver
                }
    }
}

#Preview {
    DecideFirstTimeView()
}
