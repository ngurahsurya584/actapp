import SwiftUI

struct GroundingRefocusSightView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    
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
                                
                                ForEach(0..<5) { index in
                                    ZStack(alignment: .topLeading) {
                                        if text.isEmpty {
                                            Text("Item \(index + 1) ")
                                                .foregroundColor(.gray)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 12)
                                                .zIndex(1)
                                        }
                                        
                                        TextEditor(text: $text)
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
                                
                                ForEach(0..<3) { index in
                                    ZStack(alignment: .topLeading) {
                                        if text.isEmpty {
                                            Text("Item \(index + 1) ")
                                                .foregroundColor(.gray)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 12)
                                                .zIndex(1)
                                        }
                                        
                                        TextEditor(text: $text)
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
                                    if text.isEmpty {
                                        Text("Item 1 ")
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 12)
                                            .zIndex(1)
                                    }
                                    
                                    TextEditor(text: $text)
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
                                    if text.isEmpty {
                                        Text("Item 1 ")
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 12)
                                            .zIndex(1)
                                    }
                                    
                                    TextEditor(text: $text)
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
                        NavigationLink(destination: GroundingRefocusTouchView()) {
                            Text("Next")
                                .modifier(ButtonNext())
                        }
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
}

#Preview {
    GroundingRefocusSightView()
}
