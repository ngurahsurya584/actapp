import SwiftUI

struct GroundingBreathingDownView: View {
    @State private var changePosition = false
    @State private var changeText = false

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    VStack(spacing: 10) {
                        Text(changeText ? "Slowly breath in" : "Slowly breath out")
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
            }
        }
    }
}

#Preview {
    GroundingBreathingDownView()
}
