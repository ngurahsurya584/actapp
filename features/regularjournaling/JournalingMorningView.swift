//
//  ActingOnYourValues - Default.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct JournalingMorningView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    
    let chosenFiveValues = ["Kindness", "Patience", "Supportive", "Creativity", "Hard work"]
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0){
                Text("Start your day")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .foregroundStyle(Color(red: 255/255, green: 199/255, blue: 61/255))
                    .padding(.bottom, 24)
                VStack{
                    Text("Choose 3 values to focus on today:")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 18)
                VStack{
                    WrappingHStack(horizontalSpacing: 12, verticalSpacing: 12) {
                        ForEach(chosenFiveValues, id: \.self) { value in
                            Button(value) {
                                print("Button pressed!")
                            }
                            .buttonStyle(LinearGrayButtonSmall())
                        }
                        
                    }
                    .font(.callout)
                    .padding(.bottom, 20)
                    .padding(.leading, -20)
                    
                }
                
                Text("Describe how you will demonstrate those values in detail, e. g. : Today, I will act on my values of being caring by checking on my collegues at least once a day.")
                    .font(.subheadline)
                    .foregroundStyle(Color(red: 235/255, green: 235/255, blue: 245/255))
                    .opacity(0.6)
                    .padding(.bottom, 38)
                
                ZStack(alignment: .topLeading) {
                    
                    TextEditor(text: $text)
                        .frame(width: 353, height: 301)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                        .scrollContentBackground(.hidden)
                        .background(
                            RoundedRectangle (cornerRadius: 10)
                                .fill(.white)
                                .opacity(0.13)
                        )
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .focused($isFocused)
                        .onTapGesture {
                            isFocused = true
                        }
                    
                }
                .padding(.bottom, 18)
                
                NavigationLink( destination: JournalingMorningSummaryView()){
                    Text("Next")
                        .modifier(ButtonWhiteTextYellow())
                }
                
            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
            .padding(.top, 20)
            .foregroundColor(.white)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            
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
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: LayoutSubviews, cache _: inout ()) -> CGSize {
        guard !subviews.isEmpty else { return .zero }
        
        let height = subviews.map { $0.sizeThatFits(proposal).height }.max() ?? 0
        
        var rowWidths = [CGFloat]()
        var currentRowWidth: CGFloat = 0
        subviews.forEach { subview in
            let subviewSize = subview.sizeThatFits(proposal)
            if currentRowWidth + horizontalSpacing + subviewSize.width >= proposal.width ?? 0 {
                rowWidths.append(currentRowWidth)
                currentRowWidth = subviewSize.width
            } else {
                currentRowWidth += horizontalSpacing + subviewSize.width
            }
        }
        rowWidths.append(currentRowWidth)
        
        let rowCount = CGFloat(rowWidths.count)
        return CGSize(width: proposal.width ?? 0, height: rowCount * height + (rowCount - 1) * verticalSpacing)
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout ()) {
        let height = subviews.map { $0.sizeThatFits(proposal).height }.max() ?? 0
        guard !subviews.isEmpty else { return }
        
        var rowSubviews: [(LayoutSubview, CGSize)] = []
        var currentRowWidth: CGFloat = 0
        var y = bounds.minY
        
        subviews.forEach { subview in
            let subviewSize = subview.sizeThatFits(proposal)
            if currentRowWidth + subviewSize.width > bounds.width {
                let totalRowWidth = rowSubviews.reduce(0) { $0 + $1.1.width + horizontalSpacing } - horizontalSpacing
                var x = (bounds.width - totalRowWidth) / 2
                for (view, size) in rowSubviews {
                    x += size.width / 2
                    view.place(
                        at: CGPoint(x: x, y: y + height / 2),
                        anchor: .center,
                        proposal: ProposedViewSize(width: size.width, height: size.height)
                    )
                    x += size.width / 2 + horizontalSpacing
                }
                rowSubviews = []
                y += height + verticalSpacing
                currentRowWidth = 0
            }
            rowSubviews.append((subview, subviewSize))
            currentRowWidth += subviewSize.width + horizontalSpacing
        }
        
        if !rowSubviews.isEmpty {
            let totalRowWidth = rowSubviews.reduce(0) { $0 + $1.1.width + horizontalSpacing } - horizontalSpacing
            var x = (bounds.width - totalRowWidth) / 2
            for (view, size) in rowSubviews {
                x += size.width / 2
                view.place(
                    at: CGPoint(x: x, y: y + height / 2),
                    anchor: .center,
                    proposal: ProposedViewSize(width: size.width, height: size.height)
                )
                x += size.width / 2 + horizontalSpacing
            }
        }
    }
}

#Preview {
    JournalingMorningView()
}
