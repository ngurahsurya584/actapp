import SwiftUI

struct DayJournalingView: View {
    let name = "Jennie"
    let isFinishedPractice = true

    var body: some View {
        let ctaButtonText = isFinishedPractice ? "Practice again" : "Start practice"
        
        VStack(spacing: 20) {
            VStack(spacing: 20) {
                Color.gray
            }
            .frame(width: 393, height: 295)

            VStack(alignment: .leading, spacing: 8) {
                Text("Hi (name),")
                    .font(.title2)

                Text("Start your day!")
                    .font(.title)
                    .fontWeight(.semibold)

                PracticeCardView(practiceHeading: "TODAY’S PRACTICE", titleText: "Grounding", subtitleText: "< 1 mins", descText: "Practice to slow down and engage with the world.")
                .padding(.top, 12)

                PracticeCardView(practiceHeading: "TODAY’S CHALLENGE", titleText: "Spreading Kindness", subtitleText: "Match with your value: Kind", descText: "Practice to slow down and engage with the world.")
                .padding(.top, 12)
                
                Button("\(ctaButtonText)") {
                            print("Button pressed!")
                        }
                .buttonStyle(BlackButton())
                .padding(.top, 12)
            }
            .padding()
            
            Spacer()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    DayJournalingView()
}
