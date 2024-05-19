import SwiftUI

struct OnboardingReminderSettingView: View {
    
    @State private var Morning = reMorning()
    @State private var Night = reNight()
    @State private var showReminderSettingView = false
    
    
    var body: some View {
        NavigationView{
            VStack {
                VStack(alignment: .leading) {
                    Text("Practice makes ")
                        .font(.title).bold().fontDesign(.rounded)
                    + Text("perfect")
                        .font(.title).bold().italic()
                        .fontDesign( .serif)
                    Text("Dealing with difficult thoughts and emotions is not easy. But every little bit of practice we do will come a long way. So let’s set a time to practice managing your stress!")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.top, 0.5)
                }.padding(.top, UIScreen.main.bounds.width * 0.10)
                Spacer()
                VStack{
                    DatePicker("", selection: $Night, displayedComponents: [.hourAndMinute, .hourAndMinute])
                        .datePickerStyle(.wheel)
                        .frame(width: 296, height: 185)
                        .labelsHidden()
                        .environment(\.locale, Locale(identifier: "en_US"))
                }
                Spacer()
                Spacer()
            
                NavigationLink( destination:
                    OnboardingAllSetView()){
                    Text("Next")
                        .modifier(ButtonBlack())
                    
                }
                
            }
            .padding()
        }
    }
}

func reMorning() -> Date {
    var componentsMorning = DateComponents()
    componentsMorning.hour = 8
    componentsMorning.minute = 0
    
    let dateMorning = Calendar.current.date(from: componentsMorning) ?? Date.now
    
    return dateMorning
}


func reNight() -> Date{
    var componentsNight = DateComponents()
    componentsNight.hour = 21
    componentsNight.minute = 0
    
    let dateNight = Calendar.current.date(from: componentsNight) ?? Date.now
    
    return dateNight
}

#Preview {
        OnboardingReminderSettingView()
    }
