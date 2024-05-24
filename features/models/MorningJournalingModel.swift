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
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
