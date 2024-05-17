//
//  ActingOnYourValues - Default.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct ActingOnYourValuesDefaultView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("Let’s reflect on your day")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack{
                    Text("Which value(s) did you demonstrate today that you’re proud of?")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                VStack{
                    WrappingHStack(horizontalSpacing: 10) {
                        
                        Button("Chair") {
                            print("Button pressed!")
                        }
                        .buttonStyle(BlackButtonSmall())
                        Button("Pen") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Pencil") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Table") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Laptop") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Sock") {
                            print("Button pressed!")
                        }
                        .buttonStyle(BlackButtonSmall())
                        
                    }
                    .font(.callout)
                    .padding(.horizontal, 45)
                    
                }
                Spacer()
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text("Describe what did you do in detail, e.g.: This morning, I finished the proposal that my manager asked and got praised for my meticulous writing, etc.")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                            .zIndex(1)
                    }
                    
                    TextEditor(text: $text)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                        .frame(width: 352, height: 120)
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
                Spacer()
                VStack{
                    Text("Which value(s) do you want to focus on improving tomorrow?")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                VStack{
                    WrappingHStack(horizontalSpacing: 10) {
                        
                        Button("Chair") {
                            print("Button pressed!")
                        }
                        .buttonStyle(BlackButtonSmall())
                        Button("Pen") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Pencil") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Table") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Laptop") {
                            print("Button pressed!")
                        }
                        .buttonStyle(WhiteButtonSmall())
                        Button("Sock") {
                            print("Button pressed!")
                        }
                        .buttonStyle(BlackButtonSmall())
                        
                    }
                    .font(.callout)
                    .padding(.horizontal, 45)
                    
                }
                Spacer()
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text("Describe what will you do in detail, e. g. : Tomorrow, I will act on my values of being caring by checking on my collegues at least once a day etc.")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                            .zIndex(1)
                    }
                    
                    TextEditor(text: $text)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                        .frame(width: 352, height: 120)
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
                Spacer()
                HStack {
                    NavigationLink( destination: JournalingHomeView()){
                        Text("Back")
                            .modifier(ButtonGray())
                            .frame(width: 80)
                    }
                    NavigationLink( destination: ActingOnYourValuesAffirmationView()){
                        Text("Next")
                            .modifier(ButtonBlack())
                    }
                    
                }
                
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
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
    ActingOnYourValuesDefaultView()
}
