//
//  CobaInsightsView.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 24/05/24.
//

import SwiftUI

struct CobaInsightsView: View {
    let chosenFiveValues = ["Kindness", "Patience", "Supportive", "Creativity", "Hard work"]
    let chosenoneValue = ["Kindness"]

    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    Text("Insights")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 70)
                    VStack{
                        ZStack{
                            Rectangle()
                                .fill(RadialGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0/255, green: 77/255, blue: 0/255),
                                        Color(red: 105/255, green: 210/255, blue: 152/255)
                                    ]),
                                    center: .leading,
                                    startRadius: 0,
                                    endRadius: 293))
                                .frame(width: 393, height: 233)
                            VStack{
                                Text("You've spent")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .frame(width: 361, alignment: .leading)
                                StrokeText(text: "100", width: 0.5, color: .green)
                                    .font(.system(size: 48))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .frame(width: 361, alignment: .leading)
                                Text("days practicing")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .frame(width: 361, alignment: .leading)
                                VStack{
                                    WrappingHStack(horizontalSpacing: 12, verticalSpacing: 12) {
                                        ForEach(chosenFiveValues, id: \.self) { value in
                                            Text(value).modifier(LinearWhiteButtonSmall())
                                        }
                                        
                                    }
                                    .font(.callout)
                                    .padding(.horizontal)
                                    
                                }
                                
                            }
                        }
                    }
                    VStack{
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
                        .padding()
                    }
                    Text("Today, 20 May")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    NavigationLink(destination: CobaInsightsDetailGroundingView()){
                        
                        ZStack{
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 10) {
                                    Text("☀️")
                                        .font(.system(size: 25))
                                    VStack(alignment: .leading) {
                                        Text("MORNING PLAN")
                                            .font(.headline)
                                            .foregroundColor(Color(red: 255/255, green: 199/255, blue: 61/255))
                                            .fontWeight(.bold)
                                            .padding(.bottom, 2)
                                        HStack {
                                            Text("Focused value:")
                                                .font(.caption)
                                                .multilineTextAlignment(.leading)
                                            Text("Patience, kindness, caring")
                                                .font(.caption)
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                }
                                HStack(spacing: 10) {
                                    Text("🌙")
                                        .font(.system(size: 25))
                                    VStack(alignment: .leading) {
                                        Text("NIGHT REFLECTION")
                                            .font(.headline)
                                            .foregroundColor(Color(red: 178/255, green: 219/255, blue: 255/255))
                                            .fontWeight(.bold)
                                            .padding(.bottom, 2)
                                        HStack {
                                            Text("Demonstrated value:")
                                                .font(.caption)
                                                .multilineTextAlignment(.leading)
                                            Text("Attentiveness")
                                                .font(.caption)
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                }
                                VStack{
                                    WrappingHStack(horizontalSpacing: 12, verticalSpacing: 12) {
                                        ForEach(chosenoneValue, id: \.self) { value in
                                            Text(value).modifier(LinearWhiteButtonSmall())
                                        }
                                        
                                    }
                                    .font(.callout)
                                    
                                }
                            }
                            .padding(.vertical)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                                .cornerRadius(10)
                            )
                        }
                    }
                    Text("Yesterday, 19 May")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink(destination: CobaInsightsDetailView()){
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 10) {
                                Text("☀️")
                                    .font(.system(size: 25))
                                VStack(alignment: .leading) {
                                    Text("MORNING PLAN")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 255/255, green: 199/255, blue: 61/255))
                                        .fontWeight(.bold)
                                        .padding(.bottom, 2)
                                    HStack {
                                        Text("Focused value:")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                        Text("Patience, kindness, caring")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                            HStack(spacing: 10) {
                                Text("🌙")
                                    .font(.system(size: 25))
                                VStack(alignment: .leading) {
                                    Text("NIGHT REFLECTION")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 178/255, green: 219/255, blue: 255/255))
                                        .fontWeight(.bold)
                                        .padding(.bottom, 2)
                                    HStack {
                                        Text("Demonstrated value:")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                        Text("Attentiveness")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                            
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .cornerRadius(10)
                        )
                    }
                    Text("Sunday, 20 May")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 10) {
                            Text("☀️")
                                .font(.system(size: 25))
                            VStack(alignment: .leading) {
                                Text("MORNING PLAN")
                                    .font(.headline)
                                    .foregroundColor(Color(red: 255/255, green: 199/255, blue: 61/255))
                                    .fontWeight(.bold)
                                    .padding(.bottom, 2)
                                HStack {
                                    Text("Focused value:")
                                        .font(.caption)
                                        .multilineTextAlignment(.leading)
                                    Text("Patience, kindness, caring")
                                        .font(.caption)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                        HStack(spacing: 10) {
                            Text("🌙")
                                .font(.system(size: 25))
                            VStack(alignment: .leading) {
                                Text("NIGHT REFLECTION")
                                    .font(.headline)
                                    .foregroundColor(Color(red: 178/255, green: 219/255, blue: 255/255))
                                    .fontWeight(.bold)
                                    .padding(.bottom, 2)
                                HStack {
                                    Text("Demonstrated value:")
                                        .font(.caption)
                                        .multilineTextAlignment(.leading)
                                    Text("Attentiveness")
                                        .font(.caption)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                        VStack{
                            WrappingHStack(horizontalSpacing: 12, verticalSpacing: 12) {
                                ForEach(chosenoneValue, id: \.self) { value in
                                    Text(value).modifier(LinearWhiteButtonSmall())
                                }
                                
                            }
                            .font(.callout)
                            
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .cornerRadius(10)
                    )
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
                .padding()
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity
                )
                .foregroundColor(.white)
                .background(.black)
            }
            .ignoresSafeArea(.all)
            
        }
        }
    }

struct ModalView: View {
    let feelings: [String: String]
    
    var body: some View {
        VStack {
            // Looping melalui daftar emosi dan deskripsinya
            ForEach(feelings.sorted(by: <), id: \.key) { key, value in
                VStack {
                    // Tampilkan emosi dan deskripsi dalam modal
                    Text(key)
                        .font(.headline)
                        .padding()
                    Text(value)
                        .padding()
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

private struct WrappingHStack: Layout {
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
    CobaInsightsView()
}



