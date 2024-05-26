import SwiftUI

struct GroundingPushFeetView: View {
    @State private var gradientPhase: Int = 0

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.startGradient, Color.stopGradient],
                               startPoint: startPoint(for: gradientPhase),
                               endPoint: endPoint(for: gradientPhase)
                )
                .animation(.easeInOut(duration: 7.0), value: gradientPhase)
                .onAppear {
                    AudioManager.shared.play()
                    Timer.scheduledTimer(withTimeInterval: 7.0, repeats: true) { _ in
                        gradientPhase = (gradientPhase + 1) % 4
                    }
                }
                .onDisappear {
                    AudioManager.shared.stop()
                }
                .ignoresSafeArea()

                VStack {
                    Text("Push your feet onto the floor")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .navigationBarBackButtonHidden(true)
            }
        }
    }

    func startPoint(for phase: Int) -> UnitPoint {
        switch phase {
        case 0: return .topLeading
        case 1: return .topTrailing
        case 2: return .bottomTrailing
        case 3: return .bottomLeading
        default: return .topLeading
        }
    }

    func endPoint(for phase: Int) -> UnitPoint {
        switch phase {
        case 0: return .bottomTrailing
        case 1: return .bottomLeading
        case 2: return .topLeading
        case 3: return .topTrailing
        default: return .bottomTrailing
        }
    }
}

#Preview {
    GroundingPushFeetView()
}
