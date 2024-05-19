//
//  ValueModel.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 18/05/24.
//

import Foundation


class PersonValue: ObservableObject {
    let values = ["Persistent", "Hard work", "Continued development", "Supportive", "Career progression", "Customer service", "Cooperation", "Creativity", "Collaboration", "Patient"]
    
    @Published var isChecked: [Bool]{
        didSet{
            if let encoded = try? JSONEncoder().encode(isChecked){
                UserDefaults.standard.set(encoded, forKey: "IsChecked")
            }
        }
    }
    
    
    init() {
        if let saveIsChecked = UserDefaults.standard.data(forKey: "IsChecked"){
            if let decodedIsChecked = try? JSONDecoder().decode([Bool].self, from: saveIsChecked){
                isChecked = decodedIsChecked
                return
            }
        }
        
        self.isChecked = Array(repeating: false, count: values.count)
    }
    
    
    func toggleChecked(at index: Int) {
        isChecked[index].toggle()
    }
    
    
}




