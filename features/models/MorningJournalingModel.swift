//
//  MorningJournalingModel.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 24/05/24.
//

import Foundation
import CoreData

class MorningJournalingDataController: ObservableObject{
    let container = NSPersistentContainer(name: "GrassData")
    @Published var groundingData = GroundingData()
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func getMorningJournalEntries(from startDate: Date, to endDate: Date) -> [MorningJournaling] {
            let request: NSFetchRequest<MorningJournaling> = MorningJournaling.fetchRequest()
            request.predicate = NSPredicate(format: "date >= %@ AND date <= %@", startDate as NSDate, endDate as NSDate)
            request.sortDescriptors = [NSSortDescriptor(keyPath: \MorningJournaling.date, ascending: true)]
            
            do {
                return try container.viewContext.fetch(request)
            } catch {
                print("Error fetching morning journal entries: \(error.localizedDescription)")
                return []
            }
        }
        
        func getNightJournalEntries(from startDate: Date, to endDate: Date) -> [NightJournaling] {
            let request: NSFetchRequest<NightJournaling> = NightJournaling.fetchRequest()
            request.predicate = NSPredicate(format: "date >= %@ AND date <= %@", startDate as NSDate, endDate as NSDate)
            request.sortDescriptors = [NSSortDescriptor(keyPath: \NightJournaling.date, ascending: true)]
            
            do {
                return try container.viewContext.fetch(request)
            } catch {
                print("Error fetching night journal entries: \(error.localizedDescription)")
                return []
            }
        }
        
    func getGroundingEntries(for date: Date) -> [Grounding] {
        let request: NSFetchRequest<Grounding> = Grounding.fetchRequest()
        request.predicate = NSPredicate(format: "date == %@", date as NSDate)
        do {
            return try container.viewContext.fetch(request)
        } catch {
            print("Error fetching grounding entries: \(error.localizedDescription)")
            return []
        }
    }
}

class GroundingData: ObservableObject {
    @Published var date: Date = Date()
    @Published var trigger: String = ""
    @Published var seenItems: String = ""
    @Published var heardItems: String = ""
    @Published var smeltItems: String = ""
    @Published var feltItems: String = ""
    @Published var describe: String = ""
}
