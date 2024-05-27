import SwiftUI

struct OnboardingValueSettingView: View {
    @EnvironmentObject var personValue: PersonValue
    @State private var showAlert = false
    @State private var selectedDescription: String?
    @State private var selectedValueIndex: Int?

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Focus on what ")
                        .font(.title).bold()
                    + Text("matters")
                        .font(.title).bold().italic()
                        .fontDesign(.serif)
                    Text("Values are what you want to stand for as a human being. Choose 3-5 values that are most important to you.")
                        .font(.body)
                        .fontWeight(.semibold).padding(.top, 10)
                }
                .padding(.bottom, 30)
                .multilineTextAlignment(.center)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(personValue.values.indices, id: \.self) { index in
                            VStack {
                                HStack {
                                    HStack {
                                        Button(action: {
                                            if personValue.isChecked[index] || personValue.isChecked.filter({ $0 }).count < 5 {
                                                personValue.toggleChecked(at: index)
                                            } else {
                                                showAlert = true
                                            }
                                        }) {
                                            Image(systemName: personValue.isChecked[index] ? "checkmark.circle.fill" : "circle")
                                                .foregroundColor(personValue.isChecked[index] ? Color(UIColor.systemBlue) : Color(red: 72/255, green: 72/255, blue: 74/255))
                                                .imageScale(.large)
                                        }
                                        Text(personValue.values[index].name)
                                            .font(.body)
                                            .fontWeight(.light)
                                        Spacer()
                                        Button(action: {
                                            if selectedValueIndex == index {
                                                selectedValueIndex = nil
                                            } else {
                                                selectedValueIndex = index
                                                selectedDescription = personValue.values[index].describe
                                            }
                                        }) {
                                            Image(systemName: "info.circle")
                                                .foregroundColor(.blue)
                                                .imageScale(.large)
                                                .padding(.trailing, 10)
                                        }
                                        .padding(.all, 5)
                                        .contentShape(Rectangle())
                                    }
                                    Spacer()
                                }
                                if selectedValueIndex == index {
                                    Text(personValue.values[index].describe)
                                        .padding(.leading, 40)
                                        .padding(.bottom, 5)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }
                            Divider()
                                .background(Color(red: 84/255, green: 84/255, blue: 88/255))
                                .opacity(0.65)
                            Spacer()
                        }
                    }
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(red: 28/255, green: 28/255, blue: 30/255))
                        .opacity(0.28)
                )

                Spacer()
                Spacer()
                NavigationLink(destination: OnboardingReminderSettingView()) {
                    Text("Next")
                        .modifier(ButtonWhite())
                }
            }
            .padding()
            .padding(.top, 20)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .foregroundColor(.white)
            .navigationBarBackButtonHidden()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("You can only choose up to 5 values."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.circle.fill" : "circle")
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color(red: 72/255, green: 72/255, blue: 74/255))
            .imageScale(.large)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct OnboardingValueSettingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingValueSettingView()
            .environmentObject(PersonValue())
    }
}
