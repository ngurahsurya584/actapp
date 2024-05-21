//
//  JournalingModel.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 20/05/24.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Dataact")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
}
