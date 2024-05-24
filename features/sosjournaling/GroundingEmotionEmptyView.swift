import SwiftUI
import CoreData

struct GroundingEmotionEmptyView: View {
    let feelings: [(key: String, value: String)] = [
        ("Stressed", "When you feel light-headed and it's hard to breathe because everything feels like crushing you."),
        ("Frustrated", "When you feel light-headed and it's hard to breathe because everything feels like crushing you"),
        ("Anxious", "When you feel light-headed and it's hard to breathe because everything feels like crushing you 2"),
        ("Disappointed", "When you feel light-headed and it's hard to breathe because everything feels like crushing you 4"),
        ("Insecure", "When you feel light-headed and it's hard to breathe because everything feels like crushing you 5"),
        ("Ashamed", "When you feel light-headed and it's hard to breathe because everything feels like crushing you 10"),
        ("Annoyed", "When you feel light-headed and it's hard to breathe because everything feels like crushing you"),
        ("Creativity", "When you feel light-headed and it's hard to breathe because everything feels like crushing youwqw"),
        ("Troubled", "When you feel light-headed and it's hard to breathe because everything feels like crushing youweq"),
        ("Pressured", "When you feel light-headed and it's hard to breathe because everything feels like crushing you")
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
