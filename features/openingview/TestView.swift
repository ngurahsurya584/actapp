//
//  TestView.swift
//  actapp
//
//  Created by Channy Lim on 20/05/24.
//

import SwiftUI

struct TestView: View {
    
    private enum AnimationProperties{
        static let animationSpeed: Double = 4
        static let timerDuration : TimeInterval = 3
        static let blurRadius : CGFloat = 130
    }
    
    @State private var timer = Timer.publish(every:
                                                AnimationProperties.timerDuration, on: .main, in: .common).autoconnect()
    
    @Observedobject private var animator = CircleAnimator(colors: GradientColors.all)
    
    var timeText: some View{
        Text ("11:23" )
            .font(.system(size: 88.0,weight: .medium, design: .rounded))
            .padding(.top, 50)
    }
    var dateText: some View{
        Text ("Tuesday, 18 April")
            .font(.system(size: 24,weight: .semibold, design: .rounded))
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    TestView()
}

private enum GradientColors {
    static var all : [Color]{
        [
            Color(red: 44/255, green: 120/255, blue: 115/255),
            Color(red: 44/255, green: 120/255, blue: 115/255),
            Color(red: 44/255, green: 120/255, blue: 115/255),
            Color(red: 44/255, green: 120/255, blue: 115/255),
        ]
    }
    static var backgroundColor: Color{
        Color(#colorLiteral(
            red: 0.003799867816,
            green: 0.01174801588,
            blue: 0.07808648795,
            alpha: 1)
        )
    }
}

private struct MovingCircle: Shape{
    var originOffset : CGPoint
    var animatableData: CGPoint.AnimatableData{
        get {
            originOffset.animatableData
        }
        set {
            originOffset.animatableData = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let adjusted = rect.width * originoffset.x
        let adjustedY = rect.height * originoffset.y
        let smallestDimension = main(rect.width, rect.height
                                     
         path.addArc(center: Coint (x: adjusted, y: adjustedY),
                     radius: smallestD
    }
}
                        
private class CircleAnimator: ObservableObject{
    class Circle: Identifiable {
        internal init(position: CGPoint, color: Color){
            self.position = position
            self.color = color
        }
        var position: CGPoint
            let id = UUID() .uuidString
            let color : Color
        }

    @Published private(set) var circles: [Circle] = []

    init(colors: [Color]){
        circles = colors.map({color in
            Circle(position:
                    CircleAnimator.generateRandomPosition(), color:
                    color)
        })
    }

    func animate(){
        objectwillChange.send()
        for circle in circles {
            circle.position = CircleAnimator.generateRandomPosition()
        }
    }

    static func generateRandomPosition() -> CGPoint{
        CGPoint(x:CGFloat.random(in: 0...1),y: CGFloat.random(in:
            0...1))
    }
}
