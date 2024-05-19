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
                        ForEach(0..<personValue.values.count, id: \.self) { index in
                            VStack {
                                HStack {
                                    HStack {
                                        Button(action: {
                                            personValue.toggleChecked(at: index)
                                        }) {
                                            Image(systemName: personValue.isChecked[index] ? "checkmark.circle.fill" : "circle")
                                                .foregroundColor(personValue.isChecked[index] ? Color(UIColor.systemBlue) : Color.secondary)
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
                            Spacer()
                        }
                    }
                }.padding(.bottom, 30)

                Spacer()
                Spacer()
                NavigationLink(destination: InsightsView()) {
                    Text("Next")
                        .modifier(ButtonBlack())
                }
            }
            .padding()
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingValueSettingNoBackView()
        .environmentObject(PersonValue())
       
}
