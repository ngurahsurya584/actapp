//
//  ActingOnYourValues - Affirmation.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI
import CoreData

struct ActingOnYourValuesAffirmationView: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(
        entity: Journaling.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Journaling.date, ascending: false)],
        predicate: nil
    ) private var journalEntries: FetchedResults<Journaling>
    
    private var latestEntry: Journaling? {
        journalEntries.first
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Spacer()
                if let latestEntry = latestEntry {
                    VStack {
                        Text("Today, you demonstrated your values of:")
                            .font(.body).fontWeight(.regular).foregroundColor(Color.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    VStack {
                        Text(latestEntry.todayValue ?? "")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                            .font(.custom("Helvetica Neue Italic", size: 20))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    VStack {
                        Text("Here is proof of that:")
                            .font(.body).fontWeight(.regular).foregroundColor(Color.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    VStack {
                        Text(latestEntry.todayDescribe ?? "")
                            .fontWeight(.semibold).foregroundColor(Color.black).font(.system(size: 20))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    Text("No journal entry found.")
                        .foregroundColor(Color.gray)
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack {
                    Text("You have done great! Even tiny little actions of kindness can make a difference. Be kind to yourself and be present.")
                        .font(.body).fontWeight(.semibold).foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                HStack {
                    NavigationLink(destination: ActingOnYourValuesReflectView()) {
                        Text("Finish")
                            .modifier(ButtonGreen())
                    }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ActingOnYourValuesAffirmationView()
}
