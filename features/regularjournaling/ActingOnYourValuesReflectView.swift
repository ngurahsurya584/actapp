//
//  ActingOnYourValues - Default.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI
import CoreData

struct ActingOnYourValuesReflectView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    @State private var showDescription: Bool = false
    @EnvironmentObject var userValue: PersonValue
    @Environment(\.managedObjectContext) var moc
    
    // State to keep track of selected values
    @State private var selectedValues: [Bool]
    @State private var selectedCount: Int = 0
    
    // State to manage alert presentation
    @State private var showAlert: Bool = false
    
    init() {
        // Initialize selectedValues with all false (unselected) initially
        _selectedValues = State(initialValue: Array(repeating: false, count: 5))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Let’s reflect on your day")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Text("Which value(s) did you demonstrate today that you’re proud of?")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Spacer()
                VStack {
                    WrappingHStack(horizontalSpacing: 10) {
                        // Filter and show the first 5 selected values from onboarding
                        ForEach(Array(userValue.values.enumerated().filter { userValue.isChecked[$0.offset] }.prefix(5)), id: \.offset) { index, value in
                            let isSelected = selectedValues[index]
                            Text(value)
                                .padding(.vertical)
                                .padding(.horizontal, 10)
                                .fontWeight(.bold)
                                .frame(height: 30)
                                .background(isSelected ? Color.customPrimary : Color.customWhite)
                                .foregroundColor(isSelected ? .white : .black)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color(red: 142/255, green: 142/255, blue: 147/255), lineWidth: 1)
                                )
                                .onTapGesture {
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
                        }
                    }
                    .font(.callout)
                    .padding(.horizontal, 10)
                }
                VStack {
                    Text("Describe what did you do in detail, e.g.: This morning, I finished the proposal that my manager asked and got praised for my meticulous writing, etc.")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                }
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $text)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                        .frame(width: 353, height: 301)
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
                    NavigationLink(destination: JournalingHomeView()) {
                        Text("Back")
                            .modifier(ButtonGray())
                            .frame(width: 80)
                    }
                    NavigationLink(destination: ActingOnYourValuesAffirmationView()) {
                        Text("Next")
                            .modifier(ButtonGreen())
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        saveJournalEntry()
                    })
                }
            }
            .padding()
            .alert("You can only select up to 3 values.", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // Function to save the journal entry to Core Data
    private func saveJournalEntry() {
        let selectedValuesStrings = selectedValues.enumerated()
            .filter { $0.element }
            .compactMap { $0.offset < 5 ? userValue.values[$0.offset] : nil }
            .joined(separator: ", ")
        
        let newEntry = Journaling(context: moc)
        newEntry.date = Date()
        newEntry.todayValue = selectedValuesStrings
        newEntry.todayDescribe = text
        
        do {
            try moc.save()
            print("Journal entry saved.")
        } catch {
            print("Failed to save journal entry: \(error.localizedDescription)")
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
    ActingOnYourValuesReflectView()
        .environmentObject(PersonValue())
        .environment(\.managedObjectContext, DataController().container.viewContext)
}


