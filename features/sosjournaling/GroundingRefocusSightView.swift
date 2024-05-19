//
//  GroundingRefocusSightView.swift
//  actapp
//
//  Created by Channy Lim on 14/05/24.
//

//import SwiftUI
//
//struct GroundingRefocusSightView: View {
//    @State private var text: String = ""
//    @FocusState private var isFocused: Bool
//    
//    var body: some View {
//        NavigationStack{
//            VStack {
//                
//                Text("Now, let’s refocus and engage with the world around you ").font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
//                    .padding(.horizontal)
//                Spacer()
//                VStack{
//                    Text("What are the 5 things you can see now?").font(.headline).fontWeight(.semibold)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 1 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 2 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 3 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 4 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 5 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                    
//                }
//                VStack{
//                    Text("What are the 3 things you can hear now?").font(.headline).fontWeight(.semibold)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 1 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 2 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 3 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                }
//                VStack{
//                    Text("What do you smell right now?").font(.headline).fontWeight(.semibold)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 1 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                }
//                VStack{
//                    Text("Take a moment to touch something near you. How can you descibe its texture?").font(.headline).fontWeight(.semibold).multilineTextAlignment(.center)
//                    ZStack(alignment: .topLeading) {
//                        if text.isEmpty {
//                            Text("Item 1 ")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 12)
//                                .zIndex(1)
//                        }
//                        
//                        TextEditor(text: $text)
//                            .padding(.horizontal, 3)
//                            .padding(.vertical, 5)
//                            .frame(width: 345, height: 41)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                            .focused($isFocused)
//                            .onTapGesture {
//                                isFocused = true
//                            }
//                        
//                    }
//                    .frame(width: 345, height: 41)
//                }
////                ForEach(0..<4) { _ in
////                    VStack(spacing: 16) {
////                        Text("What are the 5 things you can see now?").font(.headline).fontWeight(.semibold)
////                        WrappingHStack(horizontalSpacing: 5) {
////                            
////                            Button(action: {
////                                print("Button pressed!")
////                            }) {
////                                Image(systemName: "plus")
////                            }
////                            .buttonStyle(WhiteButtonSmall())
////                            .overlay(
////                                RoundedRectangle(cornerRadius: 50)
////                                    .stroke(Color.black, lineWidth: 1)
////                            )
////                            Button("Chair") {
////                                print("Button pressed!")
////                            }
////                            .buttonStyle(WhiteButtonSmall())
////                            Button("Pen") {
////                                print("Button pressed!")
////                            }
////                            .buttonStyle(GreenButtonSmall())
////                            Button("Pencil") {
////                                print("Button pressed!")
////                            }
////                            .buttonStyle(GreenButtonSmall())
////                            Button("Table") {
////                                print("Button pressed!")
////                            }
////                            .buttonStyle(GreenButtonSmall())
////                            Button("Table") {
////                                print("Button pressed!")
////                            }
////                            .buttonStyle(GreenButtonSmall())
////                            Button("Table") {
////                                print("Button pressed!")
////                            }
////                            .buttonStyle(GreenButtonSmall())
////                            Button("Table") {
////                                print("Button pressed!")
////                            }
////                            .buttonStyle(GreenButtonSmall())
////                            
////                        }
////                        .font(.callout)
////                    }
////                    
////                    Spacer()
////                }
//                
//                Spacer()
//                
//                HStack {
////                    NavigationLink( destination:
////                                        GroundingRefocusSightView()){
////                        Text("Back")
////                            .modifier(ButtonGray())
////                            .frame(maxWidth: 80)
////                    }
//                    
//                    //                Button("Next") {
//                    //                    print("Button pressed!")
//                    //                }
//                    //                .buttonStyle(BlackButton())
//                    NavigationLink( destination:
//                                        GroundingRefocusTouchView()){
//                        Text("Next")
//                            .modifier(ButtonGreen())
//                        
//                    }
//                    
//                }
//            }
//            .padding()
//            .navigationBarBackButtonHidden(true)
//        }
//    }
//}
//
////private struct WrappingHStack: Layout {
////    // inspired by: https://stackoverflow.com/a/75672314
////    private var horizontalSpacing: CGFloat
////    private var verticalSpacing: CGFloat
////    public init(horizontalSpacing: CGFloat, verticalSpacing: CGFloat? = nil) {
////        self.horizontalSpacing = horizontalSpacing
////        self.verticalSpacing = verticalSpacing ?? horizontalSpacing
////    }
////    
////    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache _: inout ()) -> CGSize {
////        guard !subviews.isEmpty else { return .zero }
////        
////        let height = subviews.map { $0.sizeThatFits(proposal).height }.max() ?? 0
////        
////        var rowWidths = [CGFloat]()
////        var currentRowWidth: CGFloat = 0
////        subviews.forEach { subview in
////            if currentRowWidth + horizontalSpacing + subview.sizeThatFits(proposal).width >= proposal.width ?? 0 {
////                rowWidths.append(currentRowWidth)
////                currentRowWidth = subview.sizeThatFits(proposal).width
////            } else {
////                currentRowWidth += horizontalSpacing + subview.sizeThatFits(proposal).width
////            }
////        }
////        rowWidths.append(currentRowWidth)
////        
////        let rowCount = CGFloat(rowWidths.count)
////        return CGSize(width: max(rowWidths.max() ?? 0, proposal.width ?? 0), height: rowCount * height + (rowCount - 1) * verticalSpacing)
////    }
////    
////    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
////        let height = subviews.map { $0.dimensions(in: proposal).height }.max() ?? 0
////        guard !subviews.isEmpty else { return }
////        var x = bounds.minX
////        var y = height / 2 + bounds.minY
////        subviews.forEach { subview in
////            x += subview.dimensions(in: proposal).width / 2
////            if x + subview.dimensions(in: proposal).width / 2 > bounds.maxX {
////                x = bounds.minX + subview.dimensions(in: proposal).width / 2
////                y += height + verticalSpacing
////            }
////            subview.place(
////                at: CGPoint(x: x, y: y),
////                anchor: .center,
////                proposal: ProposedViewSize(
////                    width: subview.dimensions(in: proposal).width,
////                    height: subview.dimensions(in: proposal).height
////                )
////            )
////            x += subview.dimensions(in: proposal).width / 2 + horizontalSpacing
////        }
////    }
////}
//
//#Preview {
//    GroundingRefocusSightView()
//}

import SwiftUI

struct GroundingRefocusSightView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer()
                Spacer()
                VStack {
                    Text("Now, let’s refocus and engage with the world around you ")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Text("What are the 5 things you can see now?")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(0..<5) { index in
                            ZStack(alignment: .topLeading) {
                                if text.isEmpty {
                                    Text("Item \(index + 1) ")
                                        .foregroundColor(.gray)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 12)
                                        .zIndex(1)
                                }
                                
                                TextEditor(text: $text)
                                    .padding(.horizontal, 3)
                                    .padding(.vertical, 5)
                                    .frame(width: 345, height: 41)
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
                            .frame(width: 345, height: 41)
                        }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Text("What are the 3 things you can hear now?")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(0..<3) { index in
                            ZStack(alignment: .topLeading) {
                                if text.isEmpty {
                                    Text("Item \(index + 1) ")
                                        .foregroundColor(.gray)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 12)
                                        .zIndex(1)
                                }
                                
                                TextEditor(text: $text)
                                    .padding(.horizontal, 3)
                                    .padding(.vertical, 5)
                                    .frame(width: 345, height: 41)
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
                            .frame(width: 345, height: 41)
                        }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack {
                        Text("What do you smell right now?")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ZStack(alignment: .topLeading) {
                            if text.isEmpty {
                                Text("Item 1 ")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                                    .zIndex(1)
                            }
                            
                            TextEditor(text: $text)
                                .padding(.horizontal, 3)
                                .padding(.vertical, 5)
                                .frame(width: 345, height: 41)
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
                        .frame(width: 345, height: 41)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack {
                        Text("Take a moment to touch something near you. How can you describe its texture?")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        ZStack(alignment: .topLeading) {
                            if text.isEmpty {
                                Text("Item 1 ")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                                    .zIndex(1)
                            }
                            
                            TextEditor(text: $text)
                                .padding(.horizontal, 3)
                                .padding(.vertical, 5)
                                .frame(width: 345, height: 41)
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
                        .frame(width: 345, height: 41)
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: GroundingRefocusTouchView()) {
                            Text("Next")
                                .modifier(ButtonGreen())
                        }
                    }
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    GroundingRefocusSightView()
}

