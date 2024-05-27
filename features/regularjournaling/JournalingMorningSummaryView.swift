import SwiftUI
import CoreData

struct JournalingMorningSummaryView: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(
        entity: MorningJournaling.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \MorningJournaling.date, ascending: false)],
        predicate: nil
    ) private var journalEntries: FetchedResults<MorningJournaling>
    
    private var latestEntry: MorningJournaling? {
        journalEntries.first
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("I WILL FOCUS ON THESE VALUES TODAY")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
                    .padding(.bottom, 20)
                
                if let latestEntry = latestEntry {
                    let valuesArray = latestEntry.planValue?.components(separatedBy: ", ") ?? []
                    
                    VStack {
                        HStack(spacing: 12) {
                            ForEach(valuesArray, id: \.self) { value in
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
                    
                    Text(latestEntry.describeValue ?? "")
                        .foregroundColor(.white)
                } else {
                    Text("No journal entry found.")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                NavigationLink(destination: JournalingMorningTransmission()) {
                    Text("Finish")
                        .modifier(ButtonYellow())
                }
            }
            .padding(.horizontal)
            .padding(.top, 30)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Summary")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}



#Preview {
    JournalingMorningSummaryView()
}
