//
//  CobaInsightsDetailGroundingView.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 24/05/24.
//

import SwiftUI

struct CobaInsightsDetailGroundingView: View {
    let chosenThreeValues = ["Patience", "Creativity", "Hard Work"]
    let todoMorning = "1. I will offer assistance to my colleagues with their work, especially the interns. \n2. I will strive for perfection in all of my work. \n3. I will try to come up with new solutions for each problem I’ve encountered today."
    
    let chosenThreeValue = ["Patience", "Creativity", "Hard Work"]
    let todoNight = "1. I offered assistance to my colleagues with their work, especially the interns. \n2. I strived for perfection in all of my work. \n3. I came up with new solutions for each problem I’ve encountered today."
    
    let DiffucultFeeling = ["Anxiety"]
    let ICanSee = ["Water Bottle", "ID card", "Food","Spoon", "Ipad"]
    let ICanHear = ["Water Bottle", "ID card", "Food","Spoon", "Ipad"]
    let IcanSmell = ["Fried Chicken"]
    let IFelt = ["Smooth"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("☀️ Morning.")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .foregroundStyle(Color(red: 255/255, green: 199/255, blue: 61/255))
                    Spacer()
                    Spacer()
                    VStack{
                        
                        Text("I WILL FOCUS ON THESE VALUES TODAY")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                            .padding(.bottom, 20)
                        
                        VStack {
                            HStack(spacing: 12) {
                                
                                ForEach(chosenThreeValues, id: \.self) { value in
                                    Button(value) {
                                        print("Button pressed!")
                                    }
                                    .buttonStyle(LinearGrayButtonSmall())
                                }
                                
                            }
                            .font(.callout)
                            .padding(.bottom, 40)
                            
                        }
                        
                        Text("HERE IS WHAT I WILL DO")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                            .padding(.bottom, 20)
                        
                        Text(todoMorning)
                            .foregroundStyle(Color.white)
                            .padding()
                        Spacer()
                        Spacer()
                        Rectangle()
                            .frame(width: 393, height: 1)
                            .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        Text("🌙 Night.")
                            .font(.title)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                            .foregroundStyle(Color(red: 178/255, green: 219/255, blue: 255/255))
                        Spacer()
                        Spacer()
                        VStack{
                            
                            Text("I WILL FOCUS ON THESE VALUES TODAY")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                                .padding(.bottom, 20)
                            
                            VStack {
                                HStack(spacing: 12) {
                                    
                                    ForEach(chosenThreeValue, id: \.self) { value in
                                        Text(value).modifier(LinearGrayButtonSmallTextPurple())
                                    }
                                    
                                }
                                .font(.callout)
                                .padding(.bottom, 40)
                                
                            }
                            
                            Text("HERE IS WHAT I WILL DO")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                                .padding(.bottom, 20)
                            
                            Text(todoNight)
                                .foregroundStyle(Color.white)
                                .padding()
                            Rectangle()
                                .frame(width: 393, height: 1)
                                .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            Text("🌳 Grounding")
                                .font(.system(size: 28))
                                .font(.custom("AppleColorEmoji", size: 28))
                                .font(.title)
                                .fontWeight(.bold)
                                .fontDesign(.serif)
                                .foregroundStyle(Color(red: 0/255, green: 222/255, blue: 39/255))
                            Spacer()
                            Spacer()
                            VStack{
                                
                                Text("I NOTICED THAT THESE DIFFICULT FEELINGS ARE APPEARING")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                                    .padding(.bottom, 20)
                                
                                VStack {
                                    HStack(spacing: 12) {
                                        
                                        ForEach(DiffucultFeeling, id: \.self) { value in
                                            Button(value) {
                                                print("Button pressed!")
                                            }
                                            .buttonStyle(LinearGreenButtonSmallTextPurple())
                                        }
                                        
                                    }
                                    .font(.callout)
                                    .padding(.bottom, 12)
                                    
                                }
                                
                                Text("BUT I ALSO REALIZE THAT THERE IS A WORLD AROUND ME WHERE I COULD BE PRESENT AND BE GROUNDED ON")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                                    .padding()
//                                VStack {
//                                    HStack(spacing: 12) {
//                                        
//                                        ForEach(chosenThreeValue, id: \.self) { value in
//                                            Button(value) {
//                                                print("Button pressed!")
//                                            }
//                                            .buttonStyle(LinearGreenButtonSmallTextPurple())
//                                        }
//                                        
//                                    }
//                                    .font(.callout)
//                                    .padding(.bottom, 40)
//                                    
//                                }
                                Text("I CAN SEE 👀")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                                    .padding(.bottom, 20)
                                VStack(alignment: .center){
                                    WrappingHStack(horizontalSpacing: 20, verticalSpacing: 12) {
                                        ForEach(ICanSee, id: \.self) { value in
                                            Button(value) {
                                                print("Button pressed!")
                                            }
                                            .buttonStyle(LinearGreenButtonSmallTextPurple())
                                        }
                                        
                                    }
                                    .font(.callout)
                                    .padding(.horizontal, 50)
                                    
                                }
                                Text("I CAN HEAR 👂")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                                    .padding(.bottom, 20)
                                VStack(alignment: .center){
                                    WrappingHStack(horizontalSpacing: 20, verticalSpacing: 12) {
                                        ForEach(ICanHear, id: \.self) { value in
                                            Button(value) {
                                                print("Button pressed!")
                                            }
                                            .buttonStyle(LinearGreenButtonSmallTextPurple())
                                        }
                                        
                                    }
                                    .font(.callout)
                                    .padding(.horizontal, 50)
                                    
                                }
                                Text("I CAN SMELL 👃")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                                    .padding(.bottom, 20)
                                VStack {
                                    HStack(spacing: 12) {
                                        
                                        ForEach(IcanSmell, id: \.self) { value in
                                            Button(value) {
                                                print("Button pressed!")
                                            }
                                            .buttonStyle(LinearGreenButtonSmallTextPurple())
                                        }
                                        
                                    }
                                    .font(.callout)
                                    .padding(.bottom, 12)
                                    
                                }
                                Text("I FELT SOMETHING 👐")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                                    .padding(.bottom, 20)
                                VStack {
                                    HStack(spacing: 12) {
                                        
                                        ForEach(IFelt, id: \.self) { value in
                                            Button(value) {
                                                print("Button pressed!")
                                            }
                                            .buttonStyle(LinearGreenButtonSmallTextPurple())
                                        }
                                        
                                    }
                                    .font(.callout)
                                    .padding(.bottom, 12)
                                    
                                }
                            }
                        }
                        
                        
                    }
                    
                }
                 // Memberikan warna background hitam pada tata letak utama
            }
            .padding()
            .background(Color.black)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("May 14, 2024")
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
    CobaInsightsDetailGroundingView()
}
