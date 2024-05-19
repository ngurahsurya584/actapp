import SwiftUI

struct GroundingEmotionEmptyView: View {
    
    @State private var isChecked = Array(repeating: false, count: 11)
    @State private var selectedKey: String? = nil
    
    let feelings: [String: String] = [
        "Stressed": "When you feel light-headed and it’s hard to breathe because everything feels like crushing you.",
        "Frustrated": "When you feel light-headed and it’s hard to breathe because everything feels like crushing you",
        "Anxious": "When you feel light-headed and it’s hard to breathe because everything feels like crushing you 2",
        "Disappointed": "When you feel light-headed and it’s hard to breathe because everything feels like crushing you 4",
        "Insecure": "When you feel light-headed and it’s hard to breathe because everything feels like crushing you 5",
        "Ashamed": "When you feel light-headed and it’s hard to breathe because everything feels like crushing you 10",
        "Annoyed": "When you feel light-headed and it’s hard to breathe because everything feels like crushing you",
        "Creativity": "When you feel light-headed and it’s hard to breathe because everything feels like crushing youwqw",
        "Troubled": "When you feel light-headed and it’s hard to breathe because everything feels like crushing youweq",
        "Pressured": "When you feel light-headed and it’s hard to breathe because everything feels like crushing you",
        "Apathetic": "When you feel light-headed and it’s hard to breathe because everything feels like crushing you"
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                Rectangle()
                    .stroke(Color.black, lineWidth: 2)
                    .fill(Color.gray)
                    .frame(width: 393, height: 274)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                VStack(alignment: .leading, spacing: 12) {
                    Text("NOTICE AND NAME")
                        .font(.caption2).fontWeight(.semibold).foregroundColor(Color.gray)
                    Text("A storm is brewing inside…")
                        .font(.title2)
                    Text("Choose the unkind emotion(s) you’re feeling right now")
                        .font(.title).fontWeight(.bold).foregroundColor(Color.black)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom, 12)
                
                VStack {
                    let keys = Array(feelings.keys)
                    ForEach(keys, id: \.self) { key in
                        let index = keys.firstIndex(of: key) ?? 0
                        HStack {
                            HStack {
                                CheckBoxView(checked: self.$isChecked[index])
                                Text(key)
                                    .font(.body)
                                    .fontWeight(.light)
                            }
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
                                        .background(Color.gray),
                                    alignment: .top
                                )
                                .padding(.top, 6)
                                .padding(.horizontal, -1)
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .padding(.horizontal)
                .padding(.leading, 10)
                
                HStack {
                    NavigationLink( destination:
                                        GroundingRefocusSightView()){
                        Text("Back")
                            .modifier(ButtonGray())
                            .frame(maxWidth: 80)
                    }
                    
                    //                Button("Next") {
                    //                    print("Button pressed!")
                    //                }
                    //                .buttonStyle(BlackButton())
                    NavigationLink( destination:
                        GroundingSlowingDownFinishedView()){
                        Text("Next")
                            .modifier(ButtonGreen())
                        
                    }
                    
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                Spacer()
                Spacer()
            }
            .ignoresSafeArea(.all)
        }
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

#Preview {
    GroundingEmotionEmptyView()
}
