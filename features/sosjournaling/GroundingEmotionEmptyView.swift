import SwiftUI

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
    
    @State private var selectedKey: Int?
    
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
                                isSelected: selectedKey == index,
                                onSelect: {
                                    selectedKey = selectedKey == index ? nil : index
                                }
                            )
                            Divider()
                                .background(.gray)
                        }
                    }
                    .background(.darkGray)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(minHeight: 400)
                }
                .offset(CGSize(width: 0, height: -110))
                
                NavigationLink(destination: GroundingSlowingDownInSessionView()){
                    Text("Next")
                        .fontWeight(.bold)
                        .foregroundColor(.fillButton)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .padding()
                .offset(CGSize(width: 0, height: -110.0))
            }
        }
    }
}

struct FeelingRow: View {
    let index: Int
    let feeling: String
    let description: String
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: onSelect) {
            HStack {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
                
                Text(feeling)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .foregroundColor(.blue)
            }
            .padding()
            
        }
    }
}

struct GroundingEmotionEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        GroundingEmotionEmptyView()
    }
}
