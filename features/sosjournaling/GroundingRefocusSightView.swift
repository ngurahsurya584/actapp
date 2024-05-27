import SwiftUI

struct GroundingRefocusSightView: View {
    @State private var seenItems: [String] = Array(repeating: "", count: 5)
    @State private var heardItems: [String] = Array(repeating: "", count: 3)
    @State private var smeltItem: String = ""
    @State private var feltItem: String = ""
    
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject private var groundingData: GroundingData
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    ScrollView {
                        VStack(spacing: 20) {
                            Text("Now, let's refocus and engage with the world around you")
                                .font(.title2)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .foregroundStyle(.white)
                            
                            VStack(spacing: 10) {
                                Text("What are the 5 things you can see now?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                
                                ForEach(0..<5, id: \.self) { index in
                                    TextField("", text: $seenItems[index])
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .foregroundColor(.white)
                                        .placeholder(when: seenItems[index].isEmpty) {
                                            Text("Item \(index + 1)")
                                                .foregroundColor(.gray)
                                                .padding()
                                        }
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.white)
                                                .opacity(0.13)
                                        )
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(LinearGradient(
                                                    gradient: Gradient(colors: [.white, .middleGradient, .strokeGradient]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing), lineWidth: 1)
                                        )
                                }
                            }
                            
                            VStack(spacing: 10) {
                                Text("What are the 3 things you can hear now?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                
                                ForEach(0..<3, id: \.self) { index in
                                    TextField("", text: $heardItems[index])
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .foregroundColor(.white)
                                        .placeholder(when: heardItems[index].isEmpty) {
                                            Text("Item \(index + 1)")
                                                .foregroundColor(.gray)
                                                .padding()
                                        }
                                        .background(RoundedRectangle(cornerRadius: 10)
                                            .fill(.white)
                                            .opacity(0.13))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(LinearGradient(
                                                    gradient: Gradient(colors: [.white, .middleGradient, .strokeGradient]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing), lineWidth: 1)
                                        )
                                }
                            }
                            
                            VStack(spacing: 10) {
                                Text("What do you smell right now?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                
                                TextField("", text: $smeltItem)
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.white)
                                    .placeholder(when: smeltItem.isEmpty) {
                                        Text("Item 1")
                                            .foregroundColor(.gray)
                                            .padding()
                                    }
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .opacity(0.13))
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(LinearGradient(
                                                gradient: Gradient(colors: [.white, .middleGradient, .strokeGradient]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing), lineWidth: 1)
                                    )
                            }
                            
                            VStack(spacing: 10) {
                                Text("Take a moment to touch something near you. How can you describe its texture?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                
                                TextField("", text: $feltItem)
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.white)
                                    .placeholder(when: feltItem.isEmpty) {
                                        Text("Item 1")
                                            .foregroundColor(.gray)
                                            .padding()
                                    }
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .opacity(0.13))
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(LinearGradient(
                                                gradient: Gradient(colors: [.white, .middleGradient, .strokeGradient]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing), lineWidth: 1)
                                    )
                            }
                        }
                        .padding()
                    }
                    HStack {
                        Spacer()
                        NavigationLink(destination: GroundingRefocusTouchView()) {
                            Text("Next")
                                .modifier(ButtonNext())
                        }.simultaneousGesture(TapGesture().onEnded {
                            saveGroundingData()
                        })
                        Spacer()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(Color.darkGray, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("‎‎ ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func saveGroundingData() {
            let seenItemsString = seenItems.joined(separator: ", ")
            let heardItemsString = heardItems.joined(separator: ", ")
            
            groundingData.seenItems = seenItemsString
            groundingData.heardItems = heardItemsString
            groundingData.smeltItems = smeltItem
            groundingData.feltItems = feltItem
        }
}

struct GroundingRefocusSightView_Previews: PreviewProvider {
    static var previews: some View {
        GroundingRefocusSightView()
            .environment(\.managedObjectContext, MorningJournalingDataController().container.viewContext)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
