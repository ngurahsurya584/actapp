//
//  Unhooking - Locating Pain.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 13/05/24.
//

import SwiftUI

struct Unhooking___Locating_Pain: View {
        var body: some View {
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment: .leading, spacing: 8){
                    Text("NOTICE HOOKING FEELING OR THOUGHT")
                        .font(.caption2).fontWeight(.semibold).foregroundColor(Color.gray)
                    Text("It hurts, literally….")
                        .font(.title2).fontWeight(.regular).foregroundColor(Color.black)
                    Text("Mark where the pain is located in your body")
                        .font(.title).fontWeight(.bold).foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .fill(.gray)
                        .frame(width: 393, height: 477)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Spacer()
                Spacer()
                Spacer()
                HStack {
                    Button("Back") {
                        print("Button pressed!")
                    }
                    .buttonStyle(GrayButton())
                    
                    .frame(width: 80)
                    
                    Button("Next") {
                        print("Button pressed!")
                    }
                    .buttonStyle(BlackButton())
                    
                }
                
            }
            .padding()
        }
    }

#Preview {
    Unhooking___Locating_Pain()
}
