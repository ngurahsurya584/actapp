//
//  ValueModel.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 18/05/24.
//

import Foundation


class PersonValue: ObservableObject{
    let values = ["Persistent", "Hard work", "Continued development", "Supportive", "Career progression", "Customer service", "Cooperation", "Creativity", "Collaboration", "Patient"]
    @Published var isChecked: [Bool]
    
    init() {
        self.isChecked = Array(repeating: false, count: values.count)
    }
        
    
    
    func toggleChecked(at index: Int) {
            isChecked[index].toggle()
        }
}
