//
//  actappApp.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 06/05/24.
//

import SwiftUI

@main
struct actappApp: App {
    @StateObject var dataController = MorningJournalingDataController()
    var body: some Scene {
        WindowGroup {
            DecideFirstTimeView()
                .environmentObject(PersonValue())
                .environment(\.managedObjectContext, dataController.container.viewContext)
              
        }
    }
}

