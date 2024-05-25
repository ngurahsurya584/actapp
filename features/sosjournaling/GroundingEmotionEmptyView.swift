import SwiftUI
import CoreData

struct GroundingEmotionEmptyView: View {
    let feelings: [(key: String, value: String)] = [
        ("Anger", "A strong feeling of annoyance, displeasure, or hostility."),
        ("Annoyance", "A feeling of slight anger, irritation due to disturbance or unpleasant deeds."),
        ("Contempt", "A feeling that a person is beneath consideration, worthless, or deserving scorn."),
        ("Disgust", "A feeling of revulsion or strong disapproval aroused by something unpleasant or offensive."),
        ("Irritation", "The state of feeling annoyed, impatient, or slightly angry."),
        ("Anxiety", "A feeling of worry, nervousness, or unease, typically about an imminent event or something with an uncertain outcome."),
        ("Embarrassment", "A feeling of self-consciousness, shame, or awkwardness."),
        ("Fear", "An unpleasant emotion caused by the belief that someone or something is dangerous, likely to cause pain, or a threat."),
        ("Helplessness", "The feeling or state of being unable to do anything to help yourself or anyone else."),
        ("Powerlessness", "The state or character of being powerless; absence or lack of power."),
        ("Worry", "A state of anxiety and uncertainty over actual or potential problems."),
        ("Doubt", "A feeling of uncertainty or lack of conviction."),
        ("Envy", "To feel resentful and unhappy because someone else possesses, or has achieved, what one wishes oneself to possess, or to have achieved."),
        ("Frustration", "The feeling of being upset or annoyed, especially because of inability to change or achieve something."),
        ("Guilt", "A feeling of worry or unhappiness that you have because you have done something wrong, such as causing harm to another person."),
        ("Shame", "A painful feeling of humiliation or distress caused by the consciousness of wrong or foolish behavior."),
        ("Boredom", "The feeling of being bored or uninterested in what you're doing."),
        ("Despair", "The complete loss or absence of hope."),
        ("Disappointment", "Sadness or displeasure caused by the nonfulfillment of one's hopes or expectations."),
        ("Hurt", "Unhappiness or sadness caused by someone's words or actions."),
        ("Sadness", "The feeling of being unhappy, especially because something bad has happened."),
        ("Stress", "A state of mental or emotional strain or tension resulting from adverse or very demanding circumstances."),
        ("Shock", "A sudden upsetting or surprising event or experience."),
        ("Tension", "The feeling that is produced in a situation when people are anxious and do not trust each other, and when there is a possibility of sudden violence or conflict.")
    ]

    
    @State private var changeSize = false
    @State private var selectedKeys: [Int] = []
    @State private var expandedKey: Int?
    @State private var showingAlert = false
    
    @Environment(\.managedObjectContext) private var moc
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [Color.orange, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 70 : 100
                        ))
                        
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [Color.orange, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 30 : 50
                        ))
                        .offset(x:150, y:100)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [Color.orange, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 70 : 100
                        ))
                        .offset(x:-200, y:80)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [Color.orange, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 20 : 30
                        ))
                        .offset(x:-120, y:-70)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [Color.orange, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 30 : 50
                        ))
                        .offset(x:200, y:-80)
                }
                .offset(y:-80)
                .onAppear{
                    withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)){
                        changeSize.toggle()
                    }
                }
                
                VStack {
                    Text("NOTICE AND NAME")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    Text("How do you feel right now?")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    
                    ScrollView(.vertical) {
                        ForEach(0..<feelings.count, id: \.self) { index in
                            FeelingRow(
                                index: index,
                                feeling: feelings[index].key,
                                description: feelings[index].value,
                                isSelected: selectedKeys.contains(index),
                                isExpanded: expandedKey == index,
                                onSelect: {
                                    if selectedKeys.contains(index) {
                                        selectedKeys.removeAll { $0 == index }
                                    } else if selectedKeys.count < 5 {
                                        selectedKeys.append(index)
                                    } else {
                                        showingAlert = true
                                    }
                                },
                                onInfoTap: {
                                    expandedKey = expandedKey == index ? nil : index
                                }
                            )
                            .background(expandedKey == index ? Color.gray.opacity(0.2) : Color.clear)
                            .animation(.easeInOut, value: expandedKey)
                            Divider()
                                .background(.gray)
                        }
                    }
                    .background(.darkGray)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(minHeight: 400)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Limit Exceeded"), message: Text("You can select up to 5 feelings only."), dismissButton: .default(Text("OK")))
                    }
                }
                .offset(CGSize(width: 0, height: -110))
                
                NavigationLink(destination: GroundingRefocusSightView()){
                    Text("Next")
                        .fontWeight(.bold)
                        .foregroundColor(.fillButton)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }.simultaneousGesture(TapGesture().onEnded {
                    saveSelectedKeys()
                })
                .padding()
                .offset(CGSize(width: 0, height: -110.0))
            }
        }
    }
    
    private func saveSelectedKeys() {
        let selectedFeelings = selectedKeys.map { feelings[$0].key }.joined(separator: ", ")
        
        let newGrounding = Grounding(context: moc)
        newGrounding.trigger = selectedFeelings
        
        do {
            try moc.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}

struct FeelingRow: View {
    let index: Int
    let feeling: String
    let description: String
    let isSelected: Bool
    let isExpanded: Bool
    let onSelect: () -> Void
    let onInfoTap: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button(action: onSelect) {
                    HStack {
                        Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(.blue)
                        
                        Text(feeling)
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                Button(action: onInfoTap) {
                    Image(systemName: "info.circle")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            
            if isExpanded {
                Text(description)
                    .foregroundColor(.gray)
                    .padding(.all)
                    .transition(.slide)
            }
        }
    }
}

struct GroundingEmotionEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        GroundingEmotionEmptyView()
            .environment(\.managedObjectContext, MorningJournalingDataController().container.viewContext)
    }
}
