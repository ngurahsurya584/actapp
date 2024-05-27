import SwiftUI

struct CobaInsightsView: View {
    @EnvironmentObject var personValue: PersonValue
    @EnvironmentObject var dataController: MorningJournalingDataController
    @State private var selectedMonth = Date()
    @State private var showModal = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView {
                    VStack {
                        headerView
                        monthSelectionView
                        journalEntriesView
                        Spacer()
                    }
                    .navigationBarBackButtonHidden(true)
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity
                    )
                    .foregroundColor(.white)
                }
            }
            .toolbarBackground(Color.darkGray, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("Insight")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var headerView: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 182/255, green: 182/255, blue: 182/255),
                            Color(red: 128/255, green: 128/255, blue: 128/255),
                            Color(red: 169/255, green: 169/255, blue: 169/255),
                            Color(red: 128/255, green: 128/255, blue: 128/255)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
                    .frame(width: 393, height: 265)

                VStack {
                    Text("You've spent")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    StrokeText(text: "\(personValue.daysPracticing)", width: 0.5, color: .green)
                        .font(.system(size: 48))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Text("days practicing")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    VStack {
                        WrappingHStack(horizontalSpacing: 8, verticalSpacing: 5) {
                            ForEach(Array(personValue.values.enumerated().filter { personValue.isChecked[$0.offset] }.prefix(5)), id: \.offset) { index, value in
                                Text(value.name).modifier(LinearWhiteButtonSmall())
                            }
                        }
                        .font(.callout)
                        .padding(.horizontal, 43)
                    }
                    HStack {
                        Image(systemName: "pencil")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundStyle(.white)
                        Text("Edit values")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundStyle(.white)
                    }
                    .onTapGesture {
                        showModal = true
                    }
                    .sheet(isPresented: $showModal) {
                            EditValuesView(showModal: $showModal, personValue: personValue) // Pass personValue here
                        }
                }
            }
        }
    }

    private var monthSelectionView: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                    .onTapGesture {
                        selectedMonth = Calendar.current.date(byAdding: .month, value: -1, to: selectedMonth)!
                    }
                Text(selectedMonth.formatDate())
                    .font(.body)
                Image(systemName: "chevron.right")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                    .onTapGesture {
                        selectedMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectedMonth)!
                    }
            }
            .fontWeight(.semibold)
            .padding()
        }
    }

    private var journalEntriesView: some View {
        ForEach(groupedJournalEntries(for: selectedMonth), id: \.date) { entry in
            VStack {
                Text(entry.date.formatDate())
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)

                NavigationLink(destination: CobaInsightsDetailGroundingView()) {
                    ZStack {
                        VStack(alignment: .leading, spacing: 10) {
                            entryView(icon: "☀️", title: "MORNING PLAN", value: entry.morningPlanValue, color: Color(red: 255/255, green: 199/255, blue: 61/255))
                            entryView(icon: "🌙", title: "NIGHT REFLECTION", value: entry.nightReflectValue, color: Color(red: 178/255, green: 219/255, blue: 255/255))
                            if hasGroundingData(for: entry.date) {
                                Text("Grounding").modifier(LinearWhiteButtonSmall())
                            }
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .cornerRadius(10)
                        )
                    }
                }
            }
        }
    }

    private func entryView(icon: String, title: String, value: String?, color: Color) -> some View {
        HStack(spacing: 10) {
            Text(icon)
                .font(.system(size: 25))
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(color)
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                HStack {
                    Text(title.contains("MORNING") ? "Focused value:" : "Demonstrated value:")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                    Text(value ?? "")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }

    private func groupedJournalEntries(for month: Date) -> [(date: Date, morningPlanValue: String?, nightReflectValue: String?)] {
        let calendar = Calendar.current
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!
        let endOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!

        let morningEntries = dataController.getMorningJournalEntries(from: startOfMonth, to: endOfMonth)
        let nightEntries = dataController.getNightJournalEntries(from: startOfMonth, to: endOfMonth)

        var groupedEntries: [(date: Date, morningPlanValue: String?, nightReflectValue: String?)] = []

        for date in calendar.generateDates(inside: DateInterval(start: startOfMonth, end: endOfMonth)) {
            let morningEntry = morningEntries.first(where: { calendar.isDate($0.date ?? Date(), inSameDayAs: date) })
            let nightEntry = nightEntries.first(where: { calendar.isDate($0.date ?? Date(), inSameDayAs: date) })

            groupedEntries.append((
                date: date,
                morningPlanValue: morningEntry?.planValue,
                nightReflectValue: nightEntry?.reflectValue
            ))
        }

        return groupedEntries
    }

    private func hasGroundingData(for date: Date) -> Bool {
        let groundingEntries = dataController.getGroundingEntries(for: date)
        return !groundingEntries.isEmpty
    }
}

extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}

extension Calendar {
    func generateDates(inside interval: DateInterval) -> [Date] {
        var dates: [Date] = []
        var currentDate = interval.start

        while currentDate <= interval.end {
            dates.append(currentDate)
            currentDate = self.date(byAdding: .day, value: 1, to: currentDate)!
        }

        return dates
    }
}

struct EditValuesView: View {
    @Binding var showModal: Bool
    @State var tempChecked: [Bool] = []
    @State private var selectedKey: String? = nil
    @State private var showAlert = false
    @State private var selectedDescription: String?
    @State private var selectedValueIndex: Int?
    var personValue: PersonValue

    init(showModal: Binding<Bool>, personValue: PersonValue) {
        self._showModal = showModal
        self.tempChecked = personValue.isChecked
        self.personValue = personValue
    }

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                        showModal = false
                    }) {
                        Text("Close")
                            .foregroundStyle(.blue)
                    }
                    Spacer()
                    Text("Edit Values")
                        .font(.body)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        saveSelections()
                        showModal = false
                    }) {
                        Text("Save")
                            .foregroundStyle(.blue)
                    }
                }
                .padding()
                ZStack {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                                .font(.body)
                                .fontWeight(.light)
                            Spacer()
                            Image(systemName: "mic.fill")
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.2)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .cornerRadius(10)
                    )
                }
                .padding()
                VStack {
                    ForEach(personValue.values.indices, id: \.self) { index in
                        VStack {
                            HStack {
                                HStack {
                                    Button(action: {
                                        if personValue.isChecked[index] || personValue.isChecked.filter({ $0 }).count < 5 {
                                            personValue.toggleChecked(at: index)
                                        } else {
                                            showAlert = true
                                        }
                                    }) {
                                        Image(systemName: personValue.isChecked[index] ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(personValue.isChecked[index] ? Color(UIColor.systemBlue) : Color(red: 72/255, green: 72/255, blue: 74/255))
                                            .imageScale(.large)
                                    }
                                    Text(personValue.values[index].name)
                                        .font(.body)
                                        .fontWeight(.light)
                                    Spacer()
                                    Button(action: {
                                        if selectedValueIndex == index {
                                            selectedValueIndex = nil
                                        } else {
                                            selectedValueIndex = index
                                            selectedDescription = personValue.values[index].describe
                                        }
                                    }) {
                                        Image(systemName: "info.circle")
                                            .foregroundColor(.blue)
                                            .imageScale(.large)
                                            .padding(.trailing, 10)
                                    }
                                    .padding(.all, 5)
                                    .contentShape(Rectangle())
                                }
                                Spacer()
                            }
                            if selectedValueIndex == index {
                                Text(personValue.values[index].describe)
                                    .padding(.leading, 40)
                                    .padding(.bottom, 5)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                        Divider()
                            .background(Color(red: 84/255, green: 84/255, blue: 88/255))
                            .opacity(0.65)
                        Spacer()
                    }
                }
                .padding(.horizontal, 10)
                .padding(.leading, 10)

                Spacer()
            }
        }
        .foregroundColor(.white)
        .background(.black)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Selection Limit"),
                  message: Text("You can only select up to 5 values."),
                  dismissButton: .default(Text("OK")))
        }
        .onAppear {
            tempChecked = personValue.isChecked
            if tempChecked.count != personValue.values.count {
                tempChecked = Array(repeating: false, count: personValue.values.count)
            }
        }
    }

    private func toggleTempSelection(at index: Int) {
        guard index < tempChecked.count else { return }
        if tempChecked[index] {
            tempChecked[index].toggle()
        } else {
            if tempChecked.filter({ $0 }).count < 5 {
                tempChecked[index].toggle()
            } else {
                showAlert = true
            }
        }
    }

    private func toggleSelection(for key: String) {
        selectedKey = selectedKey == key ? nil : key
    }

    private func saveSelections() {
        personValue.isChecked = tempChecked
    }
}



struct chevronView: View {
    var checked: Bool

    var body: some View {
        Image(systemName: checked ? "chevron.down" : "info.circle")
            .foregroundColor(Color(UIColor.systemBlue))
            .font(.body)
            .fontWeight(.bold)
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack {
            ZStack {
                Text(text).offset(x: width, y: width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y: width)
                Text(text).offset(x: width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
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
    CobaInsightsView()
        .environmentObject(PersonValue())
        .environmentObject(MorningJournalingDataController())
}


