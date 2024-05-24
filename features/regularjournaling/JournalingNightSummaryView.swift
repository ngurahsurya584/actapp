//
//  JournalingNightSummaryView.swift
//  actapp
//
//  Created by Channy Lim on 23/05/24.
//

import SwiftUI

struct JournalingNightSummaryView: View {
    let chosenThreeValues = ["Patience", "Creativity", "Hard Work"]
    let todo = "1. I offered assistance to my colleagues with their work, especially the interns. \n2. I strived for perfection in all of my work. \n3. I came up with new solutions for each problem I’ve encountered today."
    
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
        NavigationStack{
            VStack(spacing: 0){
                Text("I HAVE DEMONSTRATED THESE VALUES TODAY")
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
                
                
                NavigationLink( destination: JournalingNightCompletedView()){
                    Text("Finish")
                        .modifier(ButtonPurple())
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 30)
            .frame(maxWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
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
            
        }
    }
}

#Preview {
    JournalingNightSummaryView()
}
