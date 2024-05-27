import SwiftUI

struct JournalingMorningView: View {
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
                        ForEach(Array(userValue.values.enumerated().filter { userValue.isChecked[$0.offset] }.prefix(5)), id: \.offset) { index, value in
                            let isSelected = selectedValues[index]
                            let valueName = value.name // Access the "name" key
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
                                    Text(valueName) // Display the value name here
                                }
                                .buttonStyle(MorningButtonCheckedSmall())
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
                                    Text(valueName) // Display the value name here
                                }
                                .buttonStyle(LinearGrayButtonSmall())
                            }
                        }
                    }
                    .font(.callout)
                    .padding(.bottom, 20)
                }
                .alert("You can only select up to 3 values.", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
                
                Text("Describe how you will demonstrate those values in detail, e. g. : Today, I will act on my values of being caring by checking on my colleagues at least once a day.")
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
                
                NavigationLink(destination: JournalingMorningSummaryView()) {
                    Text("Next")
                        .modifier(ButtonWhiteTextYellow())
                }
                .simultaneousGesture(TapGesture().onEnded {
                    saveJournalEntry()
                })
            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
            .padding(.top, 20)
            .foregroundColor(.white)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
        }
    }
    
    private func saveJournalEntry() {
        let selectedValuesStrings = selectedValues.enumerated()
            .filter { $0.element }
            .compactMap { $0.offset < 5 ? userValue.values[$0.offset].name : nil } // Access the "name" key
            .joined(separator: ", ")
        
        let newEntry = MorningJournaling(context: moc)
        newEntry.date = Date()
        newEntry.planValue = selectedValuesStrings
        newEntry.describeValue = text
        
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


