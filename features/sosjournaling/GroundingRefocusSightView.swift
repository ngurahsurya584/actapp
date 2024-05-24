import SwiftUI

struct GroundingRefocusSightView: View {
    @State private var seenItems: [String] = Array(repeating: "", count: 5)
    @State private var heardItems: [String] = Array(repeating: "", count: 3)
    @State private var smeltItem: String = ""
    @State private var feltItem: String = ""
    @FocusState private var isFocused: Bool
    
    @Environment(\.managedObjectContext) private var moc
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    ScrollView {
                        VStack(spacing: 20) {
                            Text("Now, let’s refocus and engage with the world around you")
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
                                    ZStack(alignment: .topLeading) {
                                        if seenItems[index].isEmpty {
                                            Text("Item \(index + 1)")
                                                .foregroundColor(.gray)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 12)
                                                .zIndex(1)
                                        }
                                        
                                        TextEditor(text: $seenItems[index])
                                            .padding(.horizontal, 3)
                                            .padding(.vertical, 5)
                                            .frame(width: 345, height: 41)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [.white, .middleGradient, .strokeGradient]),
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing), lineWidth: 1)
                                                    .fill(.fillTextEditor)
                                            )
                                            .focused($isFocused)
                                            .onTapGesture {
                                                isFocused = true
                                            }
                                    }
                                    .frame(width: 345, height: 41)
                                }
                            }
                            
                            VStack(spacing: 10) {
                                Text("What are the 3 things you can hear now?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                
                                ForEach(0..<3, id: \.self) { index in
                                    ZStack(alignment: .topLeading) {
                                        if heardItems[index].isEmpty {
                                            Text("Item \(index + 1)")
                                                .foregroundColor(.gray)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 12)
                                                .zIndex(1)
                                        }
                                        
                                        TextEditor(text: $heardItems[index])
                                            .padding(.horizontal, 3)
                                            .padding(.vertical, 5)
                                            .frame(width: 345, height: 41)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [.white, .middleGradient, .strokeGradient]),
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing), lineWidth: 1)
                                                    .fill(.fillTextEditor)
                                            )
                                            .focused($isFocused)
                                            .onTapGesture {
                                                isFocused = true
                                            }
                                    }
                                    .frame(width: 345, height: 41)
                                }
                            }
                            
                            VStack(spacing: 10) {
                                Text("What do you smell right now?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                
                                ZStack(alignment: .topLeading) {
                                    if smeltItem.isEmpty {
                                        Text("Item 1")
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 12)
                                            .zIndex(1)
                                    }
                                    
                                    TextEditor(text: $smeltItem)
                                        .padding(.horizontal, 3)
                                        .padding(.vertical, 5)
                                        .frame(width: 345, height: 41)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(LinearGradient(
                                                    gradient: Gradient(colors: [.white, .middleGradient, .strokeGradient]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing), lineWidth: 1)
                                                .fill(.fillTextEditor)
                                        )
                                        .focused($isFocused)
                                        .onTapGesture {
                                            isFocused = true
                                        }
                                }
                                .frame(width: 345, height: 41)
                            }
                            
                            VStack(spacing: 10) {
                                Text("Take a moment to touch something near you. How can you describe its texture?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                
                                ZStack(alignment: .topLeading) {
                                    if feltItem.isEmpty {
                                        Text("Item 1")
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 12)
                                            .zIndex(1)
                                    }
                                    
                                    TextEditor(text: $feltItem)
                                        .padding(.horizontal, 3)
                                        .padding(.vertical, 5)
                                        .frame(width: 345, height: 41)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(LinearGradient(
                                                    gradient: Gradient(colors: [.white, .middleGradient, .strokeGradient]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing), lineWidth: 1)
                                                .fill(.fillTextEditor)
                                        )
                                        .focused($isFocused)
                                        .onTapGesture {
                                            isFocused = true
                                        }
                                }
                                .frame(width: 345, height: 41)
                            }
                        }
                        .padding()
                    }
                    HStack {
                        Spacer()
                        Button(action: saveGroundingData) {
                            Text("Next")
                                .modifier(ButtonNext())
                        }
                        NavigationLink(destination: GroundingRefocusTouchView()) {
                            EmptyView()
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
        
        let newGrounding = Grounding(context: moc)
        newGrounding.seenItems = seenItemsString
        newGrounding.heardItems = heardItemsString
        newGrounding.smeltItems = smeltItem
        newGrounding.feltItems = feltItem
        
        do {
            try moc.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}

struct GroundingRefocusSightView_Previews: PreviewProvider {
    static var previews: some View {
        GroundingRefocusSightView()
            .environment(\.managedObjectContext, MorningJournalingDataController().container.viewContext)
    }
}
