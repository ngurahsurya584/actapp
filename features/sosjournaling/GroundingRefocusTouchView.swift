import SwiftUI
import CoreData

struct GroundingRefocusTouchView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    @State private var changeSize = false
    
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject private var groundingData: GroundingData
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 70 : 100
                        ))
                        .offset(y: 80)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 30 : 50
                        ))
                        .offset(x: 150, y: 150)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 70 : 100
                        ))
                        .offset(x: -200, y: 130)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 20 : 30
                        ))
                        .offset(x: -120, y: -10)
                    
                    Circle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.buubleRefocus, Color.clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: changeSize ? 30 : 50
                        ))
                        .offset(x: 150, y: -10)
                }
                .offset(y: -80)
                .onAppear {
                    withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                        changeSize.toggle()
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("REFOCUS AND ENGAGE")
                        .font(.caption2).fontWeight(.semibold).foregroundColor(Color.gray)
                    Text("What will you refocus on now?")
                        .font(.title).fontWeight(.bold).foregroundColor(Color.white)
                    Text("e.g.: I want to refocus on writing the project proposal for my manager to review.")
                        .font(.body).fontWeight(.semibold).foregroundColor(Color.gray)
                }
                .padding(.horizontal)
                
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text("I want to refocus on ")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                            .zIndex(1)
                    }
                    
                    TextEditor(text: $text)
                        .frame(width: 353, height: 301)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                        .scrollContentBackground(.hidden)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .opacity(0.13)
                        )
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .focused($isFocused)
                        .onTapGesture {
                            isFocused = true
                        }
                        .foregroundColor(.white) // Add this line to set the text color to white
                    
                }
                .frame(width: 352, height: 300)
                
                Spacer()
                
                HStack {
                    NavigationLink( destination: GroundingSummaryView()){
                        Text("Finish")
                            .modifier(ButtonNext())
                    }.simultaneousGesture(TapGesture().onEnded {
                        saveAndNavigate()
                    })
                    
                }
                .padding()
                .padding(.bottom, 20)
            }
        }
        .ignoresSafeArea(.all)
    }
    
    private func saveAndNavigate() {
        groundingData.describe = text
        
        let newGrounding = Grounding(context: moc)
        newGrounding.date = groundingData.date
        newGrounding.trigger = groundingData.trigger
        newGrounding.seenItems = groundingData.seenItems
        newGrounding.heardItems = groundingData.heardItems
        newGrounding.smeltItems = groundingData.smeltItems
        newGrounding.feltItems = groundingData.feltItems
        newGrounding.describe = groundingData.describe
        
        do {
            try moc.save()
            print("saved")
        } catch {
            print("Failed to save context: \(error)")
        }
    }}

struct GroundingRefocusTouchView_Previews: PreviewProvider {
    static var previews: some View {
        GroundingRefocusTouchView()
            .environment(\.managedObjectContext, MorningJournalingDataController().container.viewContext)
    }
}
