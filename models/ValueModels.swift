//
//  ValueModels.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 16/05/24.
//

import Foundation


class ValuePerson: ObservableObject {
    @Published var values = ["Persistent", "Hard work", "Continued development", "Supportive", "Career progression", "Customer service", "Cooperation", "Creativity", "Collaboration", "Patient"]
    @Published var isChecked: [Bool] = []
    
    init() {
        for _ in 0..<values.count {
            isChecked.append(false)
        }
    }
}
