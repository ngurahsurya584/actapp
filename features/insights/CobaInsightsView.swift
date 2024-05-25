//
//  CobaInsightsView.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 24/05/24.
//

import SwiftUI

struct CobaInsightsView: View {
    let chosenFiveValues = ["Kindness", "Patience", "Supportive", "Creativity", "Hard work"]
    let chosenoneValue = ["Kindness"]

    @State private var showModal = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    Text("Insights")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 70)
                    VStack{
                        ZStack{
                            Rectangle()
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 182/255, green: 182/255, blue: 182/255),
                                        Color(red: 128/255, green: 128/255, blue: 128/255),
                                        Color(red: 169/255, green: 169/255, blue: 169/255),
                                        Color(red: 128/255, green: 128/255, blue: 128/255)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                                .frame(width: 393, height: 233)


                            VStack{
                                Text("You've spent")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                StrokeText(text: "100", width: 0.5, color: .green)
                                    .font(.system(size: 48))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                Text("days practicing")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                VStack{
                                    WrappingHStack(horizontalSpacing: 8, verticalSpacing: 5) {
                                        ForEach(chosenFiveValues, id: \.self) { value in
                                            Text(value).modifier(LinearWhiteButtonSmall())
                                        }
                                        
                                    }
                                    .font(.callout)
                                    .padding(.horizontal, 43)
                                }
                                HStack{
                                    Image(systemName: "pencil")
                                        .font(.callout)
                                        .fontWeight(.light)
                                        .foregroundStyle(.white)
                                    Text("Edit values")
                                        .font(.callout)
                                        .fontWeight(.light)
                                        .foregroundStyle(.white)
                                }
                                .onTapGesture {
                                    showModal = true
                                }
                                .sheet(isPresented: $showModal) {
                                    EditValuesView(showModal: $showModal)
                                    
                                }
                                
                            }
                        }
                        
                    }
                    VStack{
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 12))
                                .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                            Text("May 2024")
                                .font(.body)
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12))
                                .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                        }
                        .fontWeight(.semibold)
                        .padding()
                    }
                    Text("Today, 20 May")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    NavigationLink(destination: CobaInsightsDetailGroundingView()){
                        
                        ZStack{
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 10) {
                                    Text("☀️")
                                        .font(.system(size: 25))
                                    VStack(alignment: .leading) {
                                        Text("MORNING PLAN")
                                            .font(.headline)
                                            .foregroundColor(Color(red: 255/255, green: 199/255, blue: 61/255))
                                            .fontWeight(.bold)
                                            .padding(.bottom, 2)
                                        HStack {
                                            Text("Focused value:")
                                                .font(.caption)
                                                .multilineTextAlignment(.leading)
                                            Text("Patience, kindness, caring")
                                                .font(.caption)
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                }
                                HStack(spacing: 10) {
                                    Text("🌙")
                                        .font(.system(size: 25))
                                    VStack(alignment: .leading) {
                                        Text("NIGHT REFLECTION")
                                            .font(.headline)
                                            .foregroundColor(Color(red: 178/255, green: 219/255, blue: 255/255))
                                            .fontWeight(.bold)
                                            .padding(.bottom, 2)
                                        HStack {
                                            Text("Demonstrated value:")
                                                .font(.caption)
                                                .multilineTextAlignment(.leading)
                                            Text("Attentiveness")
                                                .font(.caption)
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                }
                                VStack{
                                    WrappingHStack(horizontalSpacing: 12, verticalSpacing: 12) {
                                        ForEach(chosenoneValue, id: \.self) { value in
                                            Text(value).modifier(LinearWhiteButtonSmall())
                                        }
                                        
                                    }
                                    .font(.callout)
                                    
                                }
                            }
                            .padding(.vertical)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                                .cornerRadius(10)
                            )
                        }
                    }
                    Text("Yesterday, 19 May")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink(destination: CobaInsightsDetailView()){
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 10) {
                                Text("☀️")
                                    .font(.system(size: 25))
                                VStack(alignment: .leading) {
                                    Text("MORNING PLAN")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 255/255, green: 199/255, blue: 61/255))
                                        .fontWeight(.bold)
                                        .padding(.bottom, 2)
                                    HStack {
                                        Text("Focused value:")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                        Text("Patience, kindness, caring")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                            HStack(spacing: 10) {
                                Text("🌙")
                                    .font(.system(size: 25))
                                VStack(alignment: .leading) {
                                    Text("NIGHT REFLECTION")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 178/255, green: 219/255, blue: 255/255))
                                        .fontWeight(.bold)
                                        .padding(.bottom, 2)
                                    HStack {
                                        Text("Demonstrated value:")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                        Text("Attentiveness")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                            
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .cornerRadius(10)
                        )
                    }
                    Text("Sunday, 20 May")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 10) {
                            Text("☀️")
                                .font(.system(size: 25))
                            VStack(alignment: .leading) {
                                Text("MORNING PLAN")
                                    .font(.headline)
                                    .foregroundColor(Color(red: 255/255, green: 199/255, blue: 61/255))
                                    .fontWeight(.bold)
                                    .padding(.bottom, 2)
                                HStack {
                                    Text("Focused value:")
                                        .font(.caption)
                                        .multilineTextAlignment(.leading)
                                    Text("Patience, kindness, caring")
                                        .font(.caption)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                        HStack(spacing: 10) {
                            Text("🌙")
                                .font(.system(size: 25))
                            VStack(alignment: .leading) {
                                Text("NIGHT REFLECTION")
                                    .font(.headline)
                                    .foregroundColor(Color(red: 178/255, green: 219/255, blue: 255/255))
                                    .fontWeight(.bold)
                                    .padding(.bottom, 2)
                                HStack {
                                    Text("Demonstrated value:")
                                        .font(.caption)
                                        .multilineTextAlignment(.leading)
                                    Text("Attentiveness")
                                        .font(.caption)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                        VStack{
                            WrappingHStack(horizontalSpacing: 12, verticalSpacing: 12) {
                                ForEach(chosenoneValue, id: \.self) { value in
                                    Text(value).modifier(LinearWhiteButtonSmall())
                                }
                                
                            }
                            .font(.callout)
                            
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .cornerRadius(10)
                    )
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
                .padding()
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity
                )
                .foregroundColor(.white)
                .background(.black)
            }
            .ignoresSafeArea(.all)
            
        }
        }
    }

struct EditValuesView: View {
    @Binding var showModal: Bool
    
    @State private var isChecked = Array(repeating: false, count: 58)
    @State private var selectedKey: String? = nil
    
    let feelings: [String: String] = [
        "Acceptance": "to be open to and accepting of myself, others, and life.",
        "Adventure": "to be adventurous; to actively seek, create, or explore novel or stimulating experiences.",
        "Assertiveness": "to respectfully stand up for my rights and request what I want",
        "Authenticity": "to be authentic, genuine, real; to be true to myself.",
        "Beauty": "to appreciate, create, nurture, or cultivate beauty in myself, others, and the environment.",
        "Caring": "to be caring towards myself, others, and the environment.",
        "Challenge": "to keep challenging myself to grow, learn, and improve.",
        "Compassion": "to act with kindness towards those who are suffering.",
        "Connection": "to engage fully in whatever I am doing and be fully present with others.",
        "Contribution": "to contribute, help, assist, or make a positive difference to myself or others.",
        "Conformity": "to be respectful and obedient of rules and obligations.",
        "Cooperation": "to be cooperative and collaborative with others.",
        "Courage": "to be courageous or brave; to persist in the face of fear, threat, or difficulty.",
        "Creativity": "to be creative or innovative.",
        "Curiosity": "to be curious, open-minded, and interested; to explore and discover.",
        "Encouragement": "to encourage and reward behavior that I value in myself or others.",
        "Equality": "to treat others as equal to myself.",
        "Excitement": "to seek, create, and engage in activities that are exciting, stimulating, or thrilling.",
        "Fairness": "to be fair to myself or others.",
        "Fitness": "to maintain or improve my fitness; to look after my physical and mental health and well-being.",
        "Flexibility": "to adjust and adapt readily to changing circumstances.",
        "Freedom": "to live freely; to choose how I live and behave, or help others do likewise.",
        "Friendliness": "to be friendly, companionable, or agreeable towards others.",
        "Forgiveness": "to be forgiving towards myself or others.",
        "Fun": "to be fun-loving; to seek, create, and engage in fun-filled activities.",
        "Generosity": "to be generous, sharing, and giving to myself or others.",
        "Gratitude": "to be grateful for and appreciative of the positive aspects of myself, others, and life.",
        "Honesty": "to be honest, truthful, and sincere with myself and others.",
        "Humor": "to see and appreciate the humorous side of life.",
        "Humility": "to be humble or modest; to let my achievements speak for themselves.",
        "Industry": "to be industrious, hard-working, and dedicated.",
        "Independence": "to be self-supportive and choose my own way of doing things.",
        "Intimacy": "to open up, reveal, and share myself- emotionally or physically in my close personal relationships.",
        "Justice": "to uphold justice and fairness.",
        "Kindness": "to be kind, compassionate, considerate, nurturing, or caring towards myself or others.",
        "Love": "to act lovingly or affectionately towards myself or others.",
        "Mindfulness": "to be conscious of, open to, and curious about my here-and-now experience.",
        "Order": "to be orderly and organized.",
        "Open-mindedness": "to think things through, see things from others’ points of view and weigh evidence fairly.",
        "Patience": "to wait calmly for what I want.",
        "Persistence": "to continue resolutely, despite problems or difficulties.",
        "Pleasure": "to create and give pleasure to myself or others.",
        "Power": "to strongly influence or wield authority over others, e.g. taking charge, leading, and organizing.",
        "Reciprocity": "to build relationships in which there is a fair balance of giving and taking.",
        "Respect:": "to be respectful towards myself or others; to be polite, considerate and show positive regard.",
        "Responsibility": "to be responsible and accountable for my actions.",
        "Romance": "to be romantic; to display and express love or strong affection.",
        "Safety": "to secure, protect, or ensure safety of myself or others.",
        "Self-awareness": "to be aware of my own thoughts, feelings, and actions.",
        "Self-care": "to look after my health and well-being and get my needs met.",
        "Self-development": "to keep growing, advancing, or improving in knowledge, skills, character or life experience.",
        "Self-control": "to act in accordance with my own ideals.",
        "Sensuality": "to create, explore, and enjoy experiences that stimulate the five senses.",
        "Sexuality": "to explore or express my sexuality.",
        "Spirituality": "to connect with things bigger than myself.",
        "Skillfulness": "to continually practice and improve my skills and apply myself fully when using them.",
        "Supportiveness": "to be supportive, helpful, encouraging, and available to myself or others",
        "Trust": "to be trustworthy; to be loyal, faithful, sincere, and reliable."
    ]
    
    var body: some View {
            ScrollView {
                VStack {
                    HStack {
                        Button(action: {
                            showModal = false
                        }) {
                            Text("Close")
                                .foregroundStyle(.blue)
                        }
                        Spacer()
                        Text("Edit Values")
                            .font(.body)
                            .fontWeight(.bold)
                        Spacer()
                        // Placeholder to balance the HStack
                        Button(action: {
                            showModal = false
                        }) {
                            Text("Save")
                                .foregroundStyle(.blue)
                        }
                    }
                    .padding()
                    ZStack {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 10) {
                                Image(systemName: "magnifyingglass")
                                    
                                Text("Search")
                                    .font(.body)
                                    .fontWeight(.light)
                                    
                                Spacer()
                                Image(systemName: "mic.fill")
                                    
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.2)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .cornerRadius(10)
                        )
                    }
                    .padding()
                    VStack {
                        let keys = Array(feelings.keys)
                        ForEach(keys, id: \.self) { key in
                            let index = keys.firstIndex(of: key) ?? 0
                            VStack(alignment: .leading) {
                                HStack {
                                    CheckBoxView(checked: self.$isChecked[index])
                                    Text(key)
                                        .font(.body)
                                        .fontWeight(.light)
                                    Spacer()
                                    chevronView(checked: self.isSelected(key: key))
                                        .onTapGesture {
                                            self.toggleSelection(for: key)
                                        }
                                }
                                if self.isSelected(key: key) {
                                    Text(self.feelings[key] ?? "")
                                        .font(.body)
                                        .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                                        .fontWeight(.light)
                                        .padding(.top, 6)
                                        .padding(.leading, 16)
                                        .overlay(
                                            Divider()
                                                .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                                                .opacity(13),
                                            alignment: .top
                                        )
                                        .padding(.top, 6)
                                        .padding(.horizontal, -1)
                                }
                            }
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(red: 28/255, green: 28/255, blue: 30/255))
                                    .opacity(0.28)
                            )
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.leading, 10)
                    
                    Spacer()
                }
            }
            .foregroundColor(.white)
            .background(.black)
        }
        
        private func isChecked(for key: String) -> Binding<Bool> {
            return Binding<Bool>(
                get: { self.selectedKey == key },
                set: { _ in self.toggleSelection(for: key) }
            )
        }
        
        private func isSelected(key: String) -> Bool {
            return self.selectedKey == key
        }
        
        private func toggleSelection(for key: String) {
            if self.selectedKey == key {
                self.selectedKey = nil
            } else {
                self.selectedKey = key
            }
        }
        
    }

struct chevronView: View {
    var checked: Bool
    
    var body: some View {
        Image(systemName: checked ? "chevron.down" : "info.circle")
            .foregroundColor(Color(UIColor.systemBlue))
            .font(.body)
            .fontWeight(.bold)
    }
}


struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

private struct WrappingHStack: Layout {
    private var horizontalSpacing: CGFloat
    private var verticalSpacing: CGFloat
    public init(horizontalSpacing: CGFloat, verticalSpacing: CGFloat? = nil) {
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing ?? horizontalSpacing
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache _: inout ()) -> CGSize {
        guard !subviews.isEmpty else { return .zero }
        
        let height = subviews.map { $0.sizeThatFits(proposal).height }.max() ?? 0
        
        var rowWidths = [CGFloat]()
        var currentRowWidth: CGFloat = 0
        subviews.forEach { subview in
            if currentRowWidth + horizontalSpacing + subview.sizeThatFits(proposal).width >= proposal.width ?? 0 {
                rowWidths.append(currentRowWidth)
                currentRowWidth = subview.sizeThatFits(proposal).width
            } else {
                currentRowWidth += horizontalSpacing + subview.sizeThatFits(proposal).width
            }
        }
        rowWidths.append(currentRowWidth)
        
        let rowCount = CGFloat(rowWidths.count)
        return CGSize(width: max(rowWidths.max() ?? 0, proposal.width ?? 0), height: rowCount * height + (rowCount - 1) * verticalSpacing)
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let height = subviews.map { $0.dimensions(in: proposal).height }.max() ?? 0
        guard !subviews.isEmpty else { return }
        var x = bounds.minX
        var y = height / 2 + bounds.minY
        subviews.forEach { subview in
            x += subview.dimensions(in: proposal).width / 2
            if x + subview.dimensions(in: proposal).width / 2 > bounds.maxX {
                x = bounds.minX + subview.dimensions(in: proposal).width / 2
                y += height + verticalSpacing
            }
            subview.place(
                at: CGPoint(x: x, y: y),
                anchor: .center,
                proposal: ProposedViewSize(
                    width: subview.dimensions(in: proposal).width,
                    height: subview.dimensions(in: proposal).height
                )
            )
            x += subview.dimensions(in: proposal).width / 2 + horizontalSpacing
        }
    }
}

#Preview {
    CobaInsightsView()
}



