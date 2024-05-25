import SwiftUI

struct GroundingBreathingDownView: View {
    @State private var changePosition = false
    @State private var changeText = false
    @State private var navigateToNextView = false

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    VStack(spacing: 10) {
                        Text(changeText ? "Slowly breathe in" : "Slowly breathe out")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
                .navigationBarBackButtonHidden(true)
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity
            )
            .foregroundColor(.white)
            .background(
                RadialGradient(
                    colors: [Color.stopGradient, Color.startGradient],
                    center: .center,
                    startRadius: 10,
                    endRadius: changePosition ? 300 : 100
                )
                .ignoresSafeArea()
            )
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { _ in
                    withAnimation(.easeInOut(duration: 4.0)) {
                        changePosition.toggle()
                    }
                    withAnimation(.bouncy(duration: 4.0)) {
                        changeText.toggle()
                    }
                }
                
                Timer.scheduledTimer(withTimeInterval: 64.0, repeats: false) { _ in
                    navigateToNextView = true
                }
            }
            .navigationDestination(isPresented: $navigateToNextView) {
                GroundingPushFeetView()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    GroundingBreathingDownView()
}
