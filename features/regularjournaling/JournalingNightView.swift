//
//  JournalingNightView.swift
//  actapp
//
//  Created by Channy Lim on 23/05/24.
//

import SwiftUI

struct JournalingNightView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    @Environment(\.managedObjectContext) var moc
    
    // State to keep track of selected values
    @State private var selectedValues: [Bool]
    @State private var selectedCount: Int = 0
    
    // State to manage alert presentation
    @State private var showAlert: Bool = false
    
    @EnvironmentObject var userValue: PersonValue
    
    init() {
        // Initialize selectedValues with all false (unselected) initially
        _selectedValues = State(initialValue: Array(repeating: false, count: 5))
    }
    
    var body: some View {
        
        NavigationStack{
            VStack {
                VStack(spacing: 0){
                    Text("Sum up your day")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .foregroundStyle(Color(red: 178/255, green: 219/255, blue: 255/255))
                        .padding(.bottom, 24)
                    VStack{
                        Text("Which value(s) have you demonstrated today?")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 18)
                    
                    VStack{
                        WrappingHStack(horizontalSpacing: 12, verticalSpacing: 12) {
                            ForEach(Array(userValue.values.enumerated().filter { userValue.isChecked[$0.offset] }.prefix(5)), id: \.offset) { index, value in
                                let isSelected = selectedValues[index]
                                if isSelected{
                                    Button(value){
                                        if selectedValues[index] {
                                            selectedValues[index].toggle()
                                            selectedCount -= 1
                                        } else if selectedCount < 3 {
                                            selectedValues[index].toggle()
                                            selectedCount += 1
                                        } else {
                                            showAlert = true
                                        }
                                    }
                                    .buttonStyle(NightButtonCheckedSmall())
                                    
                                } else{
                                    Button(value){
                                        if selectedValues[index] {
                                            selectedValues[index].toggle()
                                            selectedCount -= 1
                                        } else if selectedCount < 3 {
                                            selectedValues[index].toggle()
                                            selectedCount += 1
                                        } else {
                                            showAlert = true
                                        }
                                    }
                                    .buttonStyle(LinearGrayButtonSmallTextPurple())
                                }
                            }
                            
                            
                        }
                        .font(.callout)
                        .padding(.bottom, 20)
                        
                    }
                    
                    Text("Describe how you’ve demonstrated those values in detail, e. g. : Today, I’ve acted on my values of being caring by checking on my collegues at least once a day")
                        .font(.subheadline)
                        .foregroundStyle(Color(red: 235/255, green: 235/255, blue: 245/255))
                        .opacity(0.6)
                        .padding(.bottom, 38)
                    
                    ZStack(alignment: .topLeading) {
                        
                        TextEditor(text: $text)
                            .frame(width: 355, height: 301)
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
                    
                    NavigationLink( destination: JournalingNightSummaryView()){
                        Text("Next")
                            .modifier(ButtonWhiteTextPurple())
                    }.simultaneousGesture(TapGesture().onEnded {
                        saveJournalEntry()
                    })
                }
                .frame(maxWidth: UIScreen.main.bounds.width * 0.94, maxHeight: .infinity)
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
            .padding(.top, 20)
            .foregroundColor(.white)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
        }
        
    }
    private func saveJournalEntry() {
            let selectedValuesStrings = selectedValues.enumerated()
                .filter { $0.element }
                .compactMap { $0.offset < 5 ? userValue.values[$0.offset] : nil }
                .joined(separator: ", ")
            
        let newEntry = NightJournaling(context: moc)
            newEntry.date = Date()
            newEntry.reflectValue = selectedValuesStrings
            newEntry.reflectDescribe = text
            
            do {
                try moc.save()
                print("Journal entry saved.")
            } catch {
                print("Failed to save journal entry: \(error.localizedDescription)")
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
    JournalingNightView()
        .environmentObject(PersonValue())
       
}
