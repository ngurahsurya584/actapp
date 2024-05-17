//
//  GroundingRefocusSightView.swift
//  actapp
//
//  Created by Channy Lim on 14/05/24.
//

import SwiftUI

struct GroundingRefocusSightView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                Text("Now, let’s refocus and engage with the world around you ").font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
                ForEach(0..<4) { _ in
                    VStack(spacing: 16) {
                        Text("What are the 5 things you can see now?").font(.headline).fontWeight(.semibold)
                        WrappingHStack(horizontalSpacing: 5) {
                            
                            Button(action: {
                                print("Button pressed!")
                            }) {
                                Image(systemName: "plus")
                            }
                            .buttonStyle(WhiteButtonSmall())
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            Button("Chair") {
                                print("Button pressed!")
                            }
                            .buttonStyle(WhiteButtonSmall())
                            Button("Pen") {
                                print("Button pressed!")
                            }
                            .buttonStyle(BlackButtonSmall())
                            Button("Pencil") {
                                print("Button pressed!")
                            }
                            .buttonStyle(BlackButtonSmall())
                            Button("Table") {
                                print("Button pressed!")
                            }
                            .buttonStyle(BlackButtonSmall())
                            Button("Table") {
                                print("Button pressed!")
                            }
                            .buttonStyle(BlackButtonSmall())
                            Button("Table") {
                                print("Button pressed!")
                            }
                            .buttonStyle(BlackButtonSmall())
                            Button("Table") {
                                print("Button pressed!")
                            }
                            .buttonStyle(BlackButtonSmall())
                            
                        }
                        .font(.callout)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    NavigationLink( destination:
                                        GroundingRefocusSightView()){
                        Text("Back")
                            .modifier(ButtonGray())
                            .frame(maxWidth: 80)
                    }
                    
                    //                Button("Next") {
                    //                    print("Button pressed!")
                    //                }
                    //                .buttonStyle(BlackButton())
                    NavigationLink( destination:
                                        GroundingRefocusTouchView()){
                        Text("Next")
                            .modifier(ButtonBlack())
                        
                    }
                    
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
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
    GroundingRefocusSightView()
}
