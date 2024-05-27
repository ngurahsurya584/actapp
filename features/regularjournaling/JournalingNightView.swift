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
                                if isSelected {
                                    Button(action: {
                                        if selectedValues[index] {
                                            selectedValues[index].toggle()
                                            selectedCount -= 1
                                        } else if selectedCount < 3 {
                                            selectedValues[index].toggle()
                                            selectedCount += 1
                                        } else {
                                            showAlert = true
                                        }
                                    }) {
                                        Text(value.name) // Display the value name here
                                    }
                                    .buttonStyle(NightButtonCheckedSmall())
                                } else {
                                    Button(action: {
                                        if selectedValues[index] {
                                            selectedValues[index].toggle()
                                            selectedCount -= 1
                                        } else if selectedCount < 3 {
                                            selectedValues[index].toggle()
                                            selectedCount += 1
                                        } else {
                                            showAlert = true
                                        }
                                    }) {
                                        Text(value.name) // Display the value name here
                                    }
                                    .buttonStyle(LinearGrayButtonSmallTextPurple())
                                }
                            }
                        }
                        .font(.callout)
                        .padding(.bottom, 20)
                        .padding(.leading, -20)
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
                                RoundedRectangle(cornerRadius: 10)
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
                    
                    NavigationLink(destination: JournalingNightSummaryView()) {
                        Text("Next")
                            .modifier(ButtonWhiteTextPurple())
                    }
                    .simultaneousGesture(TapGesture().onEnded {
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
            .compactMap { $0.offset < 5 ? userValue.values[$0.offset].name : nil }
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


struct JournalingNightView_Previews: PreviewProvider {
    static var previews: some View {
        JournalingNightView()
            .environmentObject(PersonValue())
    }
}

