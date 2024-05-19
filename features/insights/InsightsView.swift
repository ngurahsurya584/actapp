//
//  OverviewView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 08/05/24.
//

import SwiftUI

struct InsightsView: View {
    @State private var currentDate: Date = .init()
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                Text("Insights")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)

                
                Divider()
                    .frame(width: UIScreen.main.bounds.width * 1)
                    .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                    .padding(.bottom, 20)
                
                HStack(spacing: 0) {
                    InsightView(title: "Days Values Practiced", value: "80", index: 0)
                    InsightView(title: "Current Streak", value: "26", index: 1)
                    InsightView(title: "Best \n Streak", value: "37", index: 2)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 216/255, green: 216/255, blue: 216/255))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 151/255, green: 151/255, blue: 151/255), lineWidth: 1)
                )
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Text("My Values")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: OnboardingValueSettingView()){
                            HStack(spacing: 4) {
                                Text("Edit")
                                Image(systemName: "chevron.right")
                            }
                        }
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Text("Remember what kind of person you want to be")
                        .font(.caption)
                        .foregroundColor(Color(red: 60/255, green: 60/355, blue: 67/255).opacity(0.6))
                    
                    WrappingHStack(horizontalSpacing: 5) {
                        Button("Kindness") {
                            print("Button pressed!")
                        }
                        .buttonStyle(PrimaryButtonSmall())
                        Button("Patience") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Supportive") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Creativity") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Hard work") {
                            print("Button pressed!")
                        }
                        .buttonStyle(PrimaryButtonSmall())
                        Button("Cooperative") {
                            print("Button pressed!")
                        }
                        .buttonStyle(PrimaryButtonSmall())
                    }
                    .font(.callout)
                }
                .padding(.top, 20)
                
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 12))
                            .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                        Text("May 2024")
                            .font(.body)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12))
                            .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                    }
                    .fontWeight(.semibold)
                    
                    WrappingHStack(horizontalSpacing: 10) {
                        Button("All") {
                            print("Button pressed!")
                        }
                        .buttonStyle(PrimaryButtonSmall())
                        Button("Grounding") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Journal") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                    }
                    .font(.callout)
                    .padding(.top, 16)
                    
                    NavigationLink(destination: InsightsDetailView()){
                        HStack(alignment: .top, spacing: 8) {
                            VStack {
                                Text("TUE")
                                Text("14")
                            }
                            .font(.system(size: 17))
                            .frame(width: 63, height: 58)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(red: 216/255, green: 216/255, blue: 216/255))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 151/255, green: 151/255, blue: 151/255), lineWidth: 1)
                            )
                            
                            HStack {
                                VStack(spacing: 8.5) {
                                    VStack(alignment: .leading) {
                                        Text("JOURNAL")
                                            .font(.system(size: 10))
                                            .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                                            .padding(.bottom, 4)
                                        HStack(alignment: .top) {
                                            Text("Demonstrated value:")
                                                .fontWeight(.bold)
                                            Text("Attentiveness")
                                        }
                                        HStack(alignment: .top) {
                                            Text("Improve on:")
                                                .fontWeight(.bold)
                                            Text("Patience")
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Rectangle()
                                        .frame(width: 1, height: 23)
                                        .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                                    
                                    VStack(alignment: .leading) {
                                        Text("GROUNDING")
                                            .font(.system(size: 10))
                                            .padding(.bottom, 4)
                                        HStack(alignment: .top) {
                                            Text("Unkind Emotions:")
                                                .fontWeight(.bold)
                                            Text("Stressed")
                                        }
                                        HStack(alignment: .top) {
                                            Text("Engaged on:")
                                                .fontWeight(.bold)
                                            Text("Table, Coffee machine, People chatting, warmth")
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                            }
                            .font(.system(size: 12))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 12)
                        .padding(.bottom, 12)
                        .foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                    }
                    .padding(.top, 16)
                }
                .padding(.top, 28)
            }
            .frame(width: UIScreen.main.bounds.width * 0.88)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct InsightView: View {
    let title: String
    let value: String
    let index: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 12))
                .frame(width: 80)
            Text(value)
                .font(.system(size: 38))
                .fontWeight(.semibold)
        }
        .multilineTextAlignment(.center)
        .frame(width: 115)
        .padding(.vertical, 10)
        .overlay(
            index < 2 ? RoundedRectangle(cornerRadius: 10)
                .frame(width: 1, height: nil, alignment: .trailing)
                .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
            : nil,
            alignment: .trailing
        )
    }
}

private struct WrappingHStack: Layout {
    // inspired by: https://stackoverflow.com/a/75672314
    private var horizontalSpacing: CGFloat
    private var verticalSpacing: CGFloat
    public init(horizontalSpacing: CGFloat, verticalSpacing: CGFloat? = nil) {
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing ?? horizontalSpacing
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache _: inout ()) -> CGSize {
        guard !subviews.isEmpty else { return .zero }
        
        let height = subviews.map { $0.sizeThatFits(proposal).height }.max() ?? 0
        
        var rowWidths = [CGFloat]()
        var currentRowWidth: CGFloat = 0
        subviews.forEach { subview in
            if currentRowWidth + horizontalSpacing + subview.sizeThatFits(proposal).width >= proposal.width ?? 0 {
                rowWidths.append(currentRowWidth)
                currentRowWidth = subview.sizeThatFits(proposal).width
            } else {
                currentRowWidth += horizontalSpacing + subview.sizeThatFits(proposal).width
            }
        }
        rowWidths.append(currentRowWidth)
        
        let rowCount = CGFloat(rowWidths.count)
        return CGSize(width: max(rowWidths.max() ?? 0, proposal.width ?? 0), height: rowCount * height + (rowCount - 1) * verticalSpacing)
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let height = subviews.map { $0.dimensions(in: proposal).height }.max() ?? 0
        guard !subviews.isEmpty else { return }
        var x = bounds.minX
        var y = height / 2 + bounds.minY
        subviews.forEach { subview in
            x += subview.dimensions(in: proposal).width / 2
            if x + subview.dimensions(in: proposal).width / 2 > bounds.maxX {
                x = bounds.minX + subview.dimensions(in: proposal).width / 2
                y += height + verticalSpacing
            }
            subview.place(
                at: CGPoint(x: x, y: y),
                anchor: .center,
                proposal: ProposedViewSize(
                    width: subview.dimensions(in: proposal).width,
                    height: subview.dimensions(in: proposal).height
                )
            )
            x += subview.dimensions(in: proposal).width / 2 + horizontalSpacing
        }
    }
}

#Preview {
    InsightsView()
}
