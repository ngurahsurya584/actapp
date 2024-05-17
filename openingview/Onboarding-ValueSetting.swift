import SwiftUI

struct Onboarding_ValueSetting: View {
    @StateObject var value = ValuePerson()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("Let's explore your ")
                        .font(.title).bold().fontDesign(.rounded)
                    + Text("values!")
                        .font(.title).bold().italic()
                        .fontDesign(.serif)
                    Text("Values describe the sort of person you want to be; how you want to treat yourself and others and the world around you. Choose the values that stand out to you the most!")
                        .font(.body)
                        .fontWeight(.semibold).padding(.top, 10)
                }.padding(.bottom, 30)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(0..<value.isChecked.count, id: \.self) { index in
                            VStack {
                                HStack {
                                    HStack {
                                        CheckBoxView(checked: $value.isChecked[index]) // Pass a binding to CheckBoxView
                                        Text(value.values[index]) // Use 'value' instead of 'self'
                                            .font(.body)
                                            .fontWeight(.light)
                                    }
                                    Spacer()
                                }
                            }
                            Divider()
                            Spacer()
                        }
                    }
                }.padding(.bottom, 30)
                Spacer()
                Spacer()
                NavigationLink(destination: Onboarding_ReminderSetting()) {
                    Text("Next")
                        .modifier(ButtonBlack())
                }
            }
            .padding()
        }
    }
}

struct CheckBoxView: View {
    @Binding var checked: Bool
    
    var body: some View {
        Image(systemName: checked ? "checkmark.circle.fill" : "circle")
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .imageScale(.large)
            .onTapGesture {
                checked.toggle()
            }
    }
}

#Preview {
    Onboarding_ValueSetting()
}
