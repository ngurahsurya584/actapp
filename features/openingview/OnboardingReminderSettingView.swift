//import SwiftUI
//
//struct OnboardingReminderSettingView: View {
//    
//    //    @State private var Morning = reMorning()
//    //    @State private var Night = reNight()
//    //    @State private var showReminderSettingView = false
//    
//    @State private var selectedTime = defaultTime()
//    let notify = NotificationHandler()
//    
//    
//    var body: some View {
//        NavigationView{
//            VStack {
//                VStack(alignment: .leading) {
//                    Text("Practice makes ")
//                        .font(.title).bold().fontDesign(.rounded)
//                    + Text("perfect")
//                        .font(.title).bold().italic()
//                        .fontDesign( .serif)
//                    Text("Dealing with difficult thoughts and emotions is not easy. But every little bit of practice we do will come a long way. So let’s set a time to practice managing your stress!")
//                        .font(.body)
//                        .fontWeight(.bold)
//                        .padding(.top, 0.5)
//                }.padding(.top, UIScreen.main.bounds.width * 0.10)
//                Spacer()
//                VStack {
//                    DatePicker("", selection: $selectedTime, displayedComponents: [.hourAndMinute])
//                        .datePickerStyle(.wheel)
//                        .frame(width: 296, height: 185)
//                        .labelsHidden()
//                        .environment(\.locale, Locale(identifier: "en_US"))
//                }
//                Button("Schedule Notification") {
//                    notify.sendNotification(
//                        date: selectedTime,
//                        type: "date", // Use lowercase to match the implementation
//                        title: "Reminder",
//                        body: "This is your scheduled reminder."
//                    )
//                }
//                .tint(.orange)
//                Spacer()
//                Spacer()
//                
//                Button("Request permissions") {
//                    notify.askPermission()
//                }
//                
//                NavigationLink( destination:
//                                    OnboardingAllSetView()){
//                    Text("Next")
//                        .modifier(ButtonBlack())
//                    
//                }
//                
//            }
//            .padding()
//        }
//    }
//}
//
////func reMorning() -> Date {
////    var componentsMorning = DateComponents()
////    componentsMorning.hour = 8
////    componentsMorning.minute = 0
////
////    let dateMorning = Calendar.current.date(from: componentsMorning) ?? Date.now
////
////    return dateMorning
////}
////
////
////func reNight() -> Date{
////    var componentsNight = DateComponents()
////    componentsNight.hour = 21
////    componentsNight.minute = 0
////
////    let dateNight = Calendar.current.date(from: componentsNight) ?? Date.now
////
////    return dateNight
////}
//
//func defaultTime() -> Date {
//    var components = DateComponents()
//    components.hour = 8
//    components.minute = 0
//    
//    return Calendar.current.date(from: components) ?? Date()
//}
//
//#Preview {
//    OnboardingReminderSettingView()
//}

//import SwiftUI
//
//struct OnboardingReminderSettingView: View {
//    @State private var selectedMorning = defaultMorning()
//    @State private var selectedNight = defaultNight()
//    let notify = NotificationHandler()
//    @State private var readyToNavigate : Bool = false
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                VStack(alignment: .leading) {
//                    Text("Practice makes ")
//                        .font(.title).bold().fontDesign(.rounded)
//                    + Text("perfect")
//                        .font(.title).bold().italic()
//                        .fontDesign(.serif)
//                    Text("Dealing with difficult thoughts and emotions is not easy. But every little bit of practice we do will come a long way. So let’s set a time to practice managing your stress!")
//                        .font(.body)
//                        .fontWeight(.semibold)
//                        .padding(.top, 0.5)
//                }
//                .padding(.top, UIScreen.main.bounds.width * 0.10)
//                
//                Spacer()
//                VStack(alignment: .leading){
//                    Text("Morning")
//                }
//                .frame(width: .infinity, alignment: .leading)
//                
//                VStack {
//                    DatePicker("", selection: $selectedMorning, displayedComponents: [.hourAndMinute])
//                        .datePickerStyle(.wheel)
//                        .frame(width: 296, height: 185)
//                        .labelsHidden()
//                        .environment(\.locale, Locale(identifier: "en_US"))
//                }
//                VStack(alignment: .leading){
//                    Text("Night")
//                }
//                .frame(width: .infinity, alignment: .leading)
//                
//                VStack {
//                    DatePicker("", selection: $selectedNight, displayedComponents: [.hourAndMinute])
//                        .datePickerStyle(.wheel)
//                        .frame(width: 296, height: 185)
//                        .labelsHidden()
//                        .environment(\.locale, Locale(identifier: "en_US"))
//                }
//                
////                Button("Schedule Notification") {
////                    notify.sendNotification(
////                        date: selectedTime,
////                        type: "date", // Use lowercase to match the implementation
////                        title: "Reminder",
////                        body: "This is your scheduled reminder."
////                    )
////                }
////                .tint(.orange)
//                
//                Spacer()
//                Spacer()
//                
////                Button("Request permissions") {
////                    notify.askPermission()
////                }
//                 
//               
//                Button(action: {
//                    notify.askPermission()
//                    readyToNavigate = true
//                    notify.sendNotification(
//                                            date: selectedMorning,
//                                            type: "date", // Use lowercase to match the implementation
//                                            title: "Reminder",
//                                            body: "This is your scheduled reminder."
//                                        )
//                }, label: {
//                    Text("Next")
//                        .modifier(ButtonBlack())
//                })
//                
////                NavigationLink(destination: OnboardingAllSetView()) {
////                    Text("Next")
////                        .modifier(ButtonBlack())
////                }
//            }
//            .padding()
//            .navigationDestination(isPresented: $readyToNavigate) {
//                OnboardingAllSetView()
//            }
////            .navigationDestination(isPresented: $ScheduleNotification)
////            {
////                notify.sendNotification(
////                                        date: selectedTime,
////                                        type: "date", // Use lowercase to match the implementation
////                                        title: "Reminder",
////                                        body: "This is your scheduled reminder."
////                                    )
////            }
//        }
//    }
//}
//
//func defaultMorning() -> Date {
//    var components = DateComponents()
//    components.hour = 8
//    components.minute = 0
//    
//    return Calendar.current.date(from: components) ?? Date()
//}
//func defaultNight() -> Date {
//    var components = DateComponents()
//    components.hour = 21
//    components.minute = 0
//    
//    return Calendar.current.date(from: components) ?? Date()
//}
//#Preview {
//    OnboardingReminderSettingView()
//}

import SwiftUI

struct OnboardingReminderSettingView: View {
    @State private var selectedMorning = defaultMorning()
    @State private var selectedNight = defaultNight()
    let notify = NotificationHandler()
    @State private var readyToNavigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Practice makes ")
                        .font(.title).bold().fontDesign(.rounded)
                    + Text("perfect")
                        .font(.title).bold().italic()
                        .fontDesign(.serif)
                    Text("Dealing with difficult thoughts and emotions is not easy. But every little bit of practice we do will come a long way. So let’s set a time to practice managing your stress!")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.top, 0.5)
                }
                .padding(.top, UIScreen.main.bounds.width * 0.10)
                
                Spacer()
                VStack(alignment: .leading){
                    Text("Morning")
                        .font(.callout)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    DatePicker("", selection: $selectedMorning, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(.wheel)
                        .frame(width: 296, height: 185)
                        .labelsHidden()
                        .environment(\.locale, Locale(identifier: "en_US"))
                }
                
                VStack(alignment: .leading){
                    Text("Night")
                        .font(.callout)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    DatePicker("", selection: $selectedNight, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(.wheel)
                        .frame(width: 296, height: 185)
                        .labelsHidden()
                        .environment(\.locale, Locale(identifier: "en_US"))
                }
                
                Spacer()
                Spacer()
                
                Button(action: {
                    notify.askPermission {
                        notify.scheduleMorningAndNightNotifications(morning: selectedMorning, night: selectedNight)
                        readyToNavigate = true
                    }
                }, label: {
                    Text("Next")
                        .modifier(ButtonBlack())
                })
            }
            .padding()
            .navigationDestination(isPresented: $readyToNavigate) {
                OnboardingAllSetView()
            }
        }
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



