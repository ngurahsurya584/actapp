import SwiftUI

struct OnboardingReminderSettingView: View {
    @State private var selectedMorning = defaultMorning()
    @State private var selectedNight = defaultNight()
    let notify = NotificationHandler()
    @State private var readyToNavigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Commit to your ")
                        .font(.title).bold()
                    + Text("values")
                        .font(.title).bold().italic()
                        .fontDesign(.serif)
                    Text("Values are what you want to stand for as a human being. Choose at least 3 values that are most important to you.")
                        .font(.body)
                        .fontWeight(.semibold).padding(.top, 10)
                }
                .padding(.bottom, 30)
                .multilineTextAlignment(.center)
                
                Text ("MORNING")
                    .font(.callout).fontDesign(.default)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                VStack {
                    DatePicker("", selection: $Morning, displayedComponents: [.hourAndMinute, .hourAndMinute])
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .frame(width: 296, height: 185)
                        .environment(\.locale, Locale(identifier: "en_US"))
                        .colorScheme(.dark)
                }
                .padding(.bottom, 18)

                Text ("NIGHT")
                    .font(.callout).fontDesign(.default)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                VStack{
                    DatePicker("", selection: $Night, displayedComponents: [.hourAndMinute, .hourAndMinute])
                        .datePickerStyle(.wheel)
                        .frame(width: 296, height: 185)
                        .labelsHidden()
                        .environment(\.locale, Locale(identifier: "en_US"))
                        .colorScheme(.dark)
                }
                
                Spacer()

                NavigationLink( destination:
                    OnboardingAllSetView()){
                    Text("Next")
                        .modifier(ButtonWhite())

                }
                
            }
            .padding()
            .padding(.top, 20)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

func defaultMorning() -> Date {
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    
    return Calendar.current.date(from: components) ?? Date()
}

func defaultNight() -> Date {
    var components = DateComponents()
    components.hour = 21
    components.minute = 0
    
    return Calendar.current.date(from: components) ?? Date()
}

#Preview {
    OnboardingReminderSettingView()
}



