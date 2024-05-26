//
//  GroundingSummaryView.swift
//  actapp
//
//  Created by Channy Lim on 24/05/24.
//

import SwiftUI

struct GroundingSummaryView: View {
    var feelings = "Anxiety"
    var seenItems = "Water Bottle, ID Card, Food, Spoon, iPad"
    var heardItems = "Water Bottle, ID Card, Food"
//    var heardItems = "Wind, People, Keyboard"
    var smeltItems = "Fried Chicken"
    var feltItems = "Smooth"
    
    func strToArr(_ str: String) -> [String] {
        return str.components(separatedBy: ",")
    }
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0){
                Text("I NOTICED THAT THESE DIFFICULT FEELINGS ARE APPEARING")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                    .padding(.bottom, 20)
                VStack{
                    HStack(spacing: 12) {
                        ForEach(strToArr(feelings), id: \.self) { value in
                            Button(value) {
                                print("Button pressed!")
                            }
                            .buttonStyle(LinearGrayButtonSmallTextGreen())
                        }
                    }
                    .font(.callout)
                    .padding(.bottom, 24)
                }
                
                Text("BUT I ALSO REALIZE THAT THERE IS A WORLD AROUND ME WHERE I COULD BE PRESENT AND BE GROUNDED ON")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                    .padding(.bottom, 20)
                
                Text("I CAN SEE 👀")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                    .padding(.bottom, 20)
                VStack{
                    WrappingHStack(horizontalSpacing: 12) {
                        ForEach(strToArr(seenItems), id: \.self) { value in
                            Button(value) {
                                print("Button pressed!")
                            }
                            .buttonStyle(LinearGrayButtonSmallTextGreen())
                        }
                    }
                    .font(.callout)
                    .padding(.bottom, 24)
                }
                
                Text("I CAN HEAR 👂")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                    .padding(.bottom, 20)
                VStack{
                    HStack(spacing: 12) {
                        ForEach(strToArr(heardItems), id: \.self) { value in
                            Button(value) {
                                print("Button pressed!")
                            }
                            .buttonStyle(LinearGrayButtonSmallTextGreen())
                        }
                    }
                    .font(.callout)
                    .padding(.bottom, 24)
                }
                
                Text("I CAN SMELL 👃")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                    .padding(.bottom, 20)
                VStack{
                    HStack(spacing: 12) {
                        ForEach(strToArr(smeltItems), id: \.self) { value in
                            Button(value) {
                                print("Button pressed!")
                            }
                            .buttonStyle(LinearGrayButtonSmallTextGreen())
                        }
                    }
                    .font(.callout)
                    .padding(.bottom, 24)
                }
                
                Text("I FELT SOMETHING 👐")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                    .padding(.bottom, 20)
                VStack{
                    HStack(spacing: 12) {
                        ForEach(strToArr(feltItems), id: \.self) { value in
                            Button(value) {
                                print("Button pressed!")
                            }
                            .buttonStyle(LinearGrayButtonSmallTextGreen())
                        }
                    }
                    .font(.callout)
                    .padding(.bottom, 24)
                }
                
                Spacer()
                
                NavigationLink( destination: JournalingView()){
                    Text("Finish")
                        .modifier(ButtonGreen())
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 30)
            .frame(maxWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Summary")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
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
    GroundingSummaryView()
}
