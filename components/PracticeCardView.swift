//
//  PracticeCardView.swift
//  actapp
//
//  Created by Channy Lim on 12/05/24.
//

import SwiftUI

struct PracticeCardView: View {
    let practiceHeading: String
    let titleText: String
    let subtitleText: String
    let descText: String
    
    init(practiceHeading: String, titleText: String, subtitleText: String, descText: String) {
        self.practiceHeading = practiceHeading
        self.titleText = titleText
        self.subtitleText = subtitleText
        self.descText = descText
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(practiceHeading)")
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(.gray)
            
            HStack() {
                VStack {
                    Image("")
                }
                .frame(width: 81, height: 104)
                .background(Color(red: 0/255, green: 0/255, blue: 0/255))
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .leading, endPoint: .trailing)
                        .opacity(0.5)
                )
                VStack(alignment: .leading) {
                    Text("\(titleText)").font(.headline)
                    Text("\(subtitleText)").font(.subheadline).foregroundColor(.gray)
                    Text("\(descText)")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
            }
            .background(Color(red: 216/255, green: 216/255, blue: 216/255))
            .cornerRadius(14)
        }
        .padding(.top, 10)
    }
}

#Preview {
    PracticeCardView(practiceHeading: "PRACTICE HEADING", titleText: "Practice Title", subtitleText: "Practice Subtitle", descText: "Practice Description")
}
