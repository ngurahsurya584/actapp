//
//  MakingRoom - Affirmation.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct MakingRoom___Affirmation: View {
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Spacer()
                VStack{
                    Text("Many difficult thoughts and feelings appear when you face difficult situations - especially if you cannot improve them! So we unhook and ground ourselves…")
                        .font(.body).fontWeight(.semibold).foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack{
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .fill(.gray)
                        .frame(width: 393, height: 425)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Spacer()
                VStack{
                    Text("Change what can be changed, accept the pain that cannot be changed, and continue to live by your values!")
                        .font(.body).fontWeight(.semibold).foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                HStack {
                    Button("Back") {
                        print("Button pressed!")
                    }
                    .buttonStyle(GrayButton())
                    
                    .frame(width: 80)
                    
                    Button("Close") {
                        print("Button pressed!")
                    }
                    .buttonStyle(BlackButton())
                    
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    MakingRoom___Affirmation()
}
