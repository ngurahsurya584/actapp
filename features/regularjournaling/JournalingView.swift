import SwiftUI
import CoreData

struct JournalingView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TodaysFocusView()
                MorningEveningLinksView()
                GroundingNoticeView()
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 20)
            .foregroundColor(.white)
            .background(Color.black)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TodaysFocusView: View {
    @State private var changeSize = false
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(
        entity: MorningJournaling.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \MorningJournaling.date, ascending: false)],
        predicate: nil
    ) private var journalEntries: FetchedResults<MorningJournaling>
    
    private var todaysValues: [String] {
        if let latestEntry = journalEntries.first, let planValue = latestEntry.planValue {
            return planValue.components(separatedBy: ", ")
        }
        return []
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("TODAY’S FOCUS")
                    .font(.system(size: 12))
                    .fontWeight(.heavy)
                    .padding(.bottom, 4)
                
                if todaysValues.isEmpty {
                    Text("No focus values yet")
                        .titleStyle()
                        .frame(width: UIScreen.main.bounds.width * 0.5, alignment: .center)
                } else {
                    ForEach(Array(todaysValues.enumerated()), id: \.offset) { index, value in
                        Text(value)
                            .titleStyle()
                            .frame(width: frameWidth(for: index), alignment: frameAlignment(for: index))
                    }
                }
            }
            .zIndex(2)
            Circle()
                .fill(RadialGradient(
                    gradient: Gradient(colors: [.buttonAovStart,.buttonAovMiddle, .buttonAovStop, .clear]),
                    center: .center,
                    startRadius: 0,
                    endRadius: changeSize ? 200 : 160
                ))
                .onAppear {
                    withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                        changeSize.toggle()
                    }
                }
        }
    }
    
    private func frameWidth(for index: Int) -> CGFloat {
        switch index {
        case 0:
            return UIScreen.main.bounds.width * 0.5
        case 1:
            return UIScreen.main.bounds.width * 0.5
        case 2:
            return UIScreen.main.bounds.width * 0.3
        default:
            return UIScreen.main.bounds.width * 0.5
        }
    }
    
    private func frameAlignment(for index: Int) -> Alignment {
        switch index {
        case 0:
            return .leading
        case 1:
            return .trailing
        case 2:
            return .leading
        default:
            return .center
        }
    }
}

struct MorningEveningLinksView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: JournalingMorningView()) {
                JournalLinkView(title: "Start your day", desc:"Plan how you will act on your values", emoji: "☀️", color: Color(red: 255/255, green: 199/255, blue: 61/255))
            }
            .layoutPriority(1)
            NavigationLink(destination: JournalingNightView()) {
                JournalLinkView(title: "Evening reflection", desc: "Sum up your day", emoji: "🌙", color: Color(red: 178/255, green: 219/255, blue: 255/255))
            }
            .layoutPriority(1)
        }
        .frame(maxWidth: .infinity, maxHeight: 202)
    }
}

struct GroundingNoticeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("FOR WHEN YOU’RE FEELING DISTRAUGHT")
                .font(.caption2)
            NavigationLink(destination: GroundingEmotionEmptyView()) {
                GroundingLinkView()
            }
        }
        .padding(.top, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct JournalLinkView: View {
    let title: String
    let desc: String
    let emoji: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(color)
                .fontDesign(.serif)
            Text("\(desc)\n")
                .font(.subheadline)
            Text(emoji)
                .font(.system(size: 48))
                .font(.custom("AppleColorEmoji", size: 40))
        }
        .padding(3)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(20)
        )
    }
}

struct GroundingLinkView: View {
    var body: some View {
        HStack(spacing: 10) {
            Text("🌳")
                .font(.system(size: 48))
                .font(.custom("AppleColorEmoji", size: 48))
            VStack(alignment: .leading) {
                Text("Grounding")
                    .font(.headline)
                    .foregroundColor(Color(red: 0/255, green: 222/255, blue: 39/255))
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                    .fontDesign(.serif)
                Text("Practice to slow down and engage with the world.")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(maxWidth: .infinity)
            .cornerRadius(20)
        )
    }
}

extension Text {
    func titleStyle() -> some View {
        self
            .font(.title3)
            .fontDesign(.serif)
            .fontWeight(.semibold)
    }
}

#Preview {
    JournalingView()
        .environment(\.managedObjectContext, MorningJournalingDataController().container.viewContext)
}
