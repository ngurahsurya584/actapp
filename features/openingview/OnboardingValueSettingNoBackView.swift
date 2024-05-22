//
//  OnboardingValueSettingNoBackView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 20/05/24.
//

import SwiftUI

struct OnboardingValueSettingNoBackView: View {
    @EnvironmentObject var personValue: PersonValue
  
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Focus on what ")
                        .font(.title).bold()
                    + Text("matters")
                        .font(.title).bold().italic()
                        .fontDesign(.serif)
                    Text("Values are what you want to stand for as a human being. Choose at least 3 values that are most important to you.")
                        .font(.body)
                        .fontWeight(.semibold).padding(.top, 10)
                }
                .padding(.bottom, 30)
                .multilineTextAlignment(.center)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(0..<personValue.values.count, id: \.self) { index in
                            VStack {
                                HStack {
                                    HStack {
                                        Button(action: {
                                            personValue.toggleChecked(at: index)
                                        }) {
                                            Image(systemName: personValue.isChecked[index] ? "checkmark.circle.fill" : "circle")
                                                .foregroundColor(personValue.isChecked[index] ? Color(UIColor.systemBlue) : Color(red: 72/255, green: 72/255, blue: 74/255))
                                                .imageScale(.large)
                                        }
                                        Text(personValue.values[index])
                                            .font(.body)
                                            .fontWeight(.light)
                                    }
                                    Spacer()
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
                NavigationLink(destination: InsightsView()) {
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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingValueSettingNoBackView()
        .environmentObject(PersonValue())
       
}
