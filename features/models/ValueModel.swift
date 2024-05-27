//
//  ValueModel.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 18/05/24.
//

import Foundation


class PersonValue: ObservableObject {
    let values: [(name: String, describe: String)] = [
        ("Acceptance", "To be open to and accepting of myself, others, and life."),
        ("Adventure", "To be adventurous; to actively seek, create, or explore novel or stimulating experiences."),
        ("Assertiveness", "To respectfully stand up for my rights and request what I want."),
        ("Authenticity", "To be authentic, genuine, real; to be true to myself."),
        ("Beauty", "To appreciate, create, nurture, or cultivate beauty in myself, others, and the environment."),
        ("Caring", "To be caring towards myself, others, and the environment."),
        ("Challenge", "To keep challenging myself to grow, learn, and improve."),
        ("Compassion", "To act with kindness towards those who are suffering."),
        ("Connection", "To engage fully in whatever I am doing and be fully present with others."),
        ("Contribution", "To contribute, help, assist, or make a positive difference to myself or others."),
        ("Conformity", "To be respectful and obedient of rules and obligations."),
        ("Cooperation", "To be cooperative and collaborative with others."),
        ("Courage", "To be courageous or brave; to persist in the face of fear, threat, or difficulty."),
        ("Creativity", "To be creative or innovative."),
        ("Curiosity", "To be curious, open-minded, and interested; to explore and discover."),
        ("Encouragement", "To encourage and reward behavior that I value in myself or others."),
        ("Equality", "To treat others as equal to myself."),
        ("Excitement", "To seek, create, and engage in activities that are exciting, stimulating, or thrilling."),
        ("Fairness", "To be fair to myself or others."),
        ("Fitness", "To maintain or improve my fitness; to look after my physical and mental health and well-being."),
        ("Flexibility", "To adjust and adapt readily to changing circumstances."),
        ("Freedom", "To live freely; to choose how I live and behave, or help others do likewise."),
        ("Friendliness", "To be friendly, companionable, or agreeable towards others."),
        ("Forgiveness", "To be forgiving towards myself or others."),
        ("Fun", "To be fun-loving; to seek, create, and engage in fun-filled activities."),
        ("Generosity", "To be generous, sharing, and giving to myself or others."),
        ("Gratitude", "To be grateful for and appreciative of the positive aspects of myself, others, and life."),
        ("Honesty", "To be honest, truthful, and sincere with myself and others."),
        ("Humor", "To see and appreciate the humorous side of life."),
        ("Humility", "To be humble or modest; to let my achievements speak for themselves."),
        ("Industry", "To be industrious, hard-working, and dedicated."),
        ("Independence", "To be self-supportive and choose my own way of doing things."),
        ("Intimacy", "To open up, reveal, and share myself emotionally or physically in my close personal relationships."),
        ("Justice", "To uphold justice and fairness."),
        ("Kindness", "To be kind, compassionate, considerate, nurturing, or caring towards myself or others."),
        ("Love", "To act lovingly or affectionately towards myself or others."),
        ("Mindfulness", "To be conscious of, open to, and curious about my here-and-now experience."),
        ("Order", "To be orderly and organized."),
        ("Open-mindedness", "To think things through, see things from others’ points of view and weigh evidence fairly."),
        ("Patience", "To wait calmly for what I want."),
        ("Persistence", "To continue resolutely, despite problems or difficulties."),
        ("Pleasure", "To create and give pleasure to myself or others."),
        ("Power", "To strongly influence or wield authority over others, e.g., taking charge, leading, and organizing."),
        ("Reciprocity", "To build relationships in which there is a fair balance of giving and taking."),
        ("Respect", "To be respectful towards myself or others; to be polite, considerate, and show positive regard."),
        ("Responsibility", "To be responsible and accountable for my actions."),
        ("Romance", "To be romantic; to display and express love or strong affection."),
        ("Safety", "To secure, protect, or ensure the safety of myself or others."),
        ("Self-awareness", "To be aware of my own thoughts, feelings, and actions."),
        ("Self-care", "To look after my health and well-being and get my needs met."),
        ("Self-development", "To keep growing, advancing, or improving in knowledge, skills, character, or life experience."),
        ("Self-control", "To act in accordance with my own ideals."),
        ("Sensuality", "To create, explore, and enjoy experiences that stimulate the five senses."),
        ("Sexuality", "To explore or express my sexuality."),
        ("Spirituality", "To connect with things bigger than myself."),
        ("Skillfulness", "To continually practice and improve my skills and apply myself fully when using them."),
        ("Supportiveness", "To be supportive, helpful, encouraging, and available to myself or others."),
        ("Trust", "To be trustworthy; to be loyal, faithful, sincere, and reliable.")
    ]

    @Published var daysPracticing: Int = 0
    
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
    
    func selectedValues() -> [String] {
            return values.enumerated().compactMap { index, value in
                isChecked[index] ? value.name : nil
            }
        }
        
        func incrementDaysPracticing() {
            daysPracticing += 1
        }
    
    
}




