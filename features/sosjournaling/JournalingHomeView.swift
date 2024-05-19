import SwiftUI

struct JournalingHomeView: View {
    let name = "Jennie"
    let isFinishedPractice = true

    var body: some View {
//        let ctaButtonText = isFinishedPractice ? "Practice again" : "Start practice"
        
        VStack(spacing: 20) {
            VStack(spacing: 20) {
                ZStack{
                    Image("Senyum")
                    
                    
                    
                }
            }
            .frame(width: 393, height: 295)
            

            VStack(alignment: .leading, spacing: 8) {
                Text("Hi Jennie,")
                    .font(.title2)

                Text("Start your day!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                ZStack{
                    
                    
                    PracticeCardView(practiceHeading: "TODAY’S HIGHLIGHTED VALUE", titleText: "Being Kind", /*subtitleText: "< 1 mins",*/ descText: "I will complement my colleagues outfit and apreciate their work more. I think I can offer help here and there if I have the time.")
                        .padding(.top, 12)
                    
                    Image("Love")
                        .padding(.top, 35)
                        .frame(width: 340, height: 104, alignment: .leading)
                }
                
                ZStack{
                    
                    PracticeCardView(practiceHeading: "FOR WHEN YOU’RE FEELING DISTRAUGHT", titleText: "Grounding", /*subtitleText: "Match with your value: Kind",*/ descText: "Practice to slow down and engage with the world.")
                        .padding(.top, 12)
                    VStack{
                        Image("rumput")
                            .padding(.top, 35)
                            .frame(width: 360, height: 104, alignment: .leading)
                    }
                }
                
                NavigationLink( destination: ActingOnYourValuesAffirmationView()){
                    Text("Check In")
                        .modifier(ButtonGreen())
                }
                .padding(.top, 12)
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            
            Spacer()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    JournalingHomeView()
}
