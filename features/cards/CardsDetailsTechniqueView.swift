//
//  CardsDetailsTechniqueView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 12/05/24.
//

import SwiftUI

struct CardsDetailsTechniqueView: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle().frame(width: 393, height: 396, alignment: .top).foregroundStyle(.cardbottomcolor)
                Text("ini gambar")
            }.padding(.bottom)

            HStack(){
                Text("TECHNIQUE").font(.caption).fontWeight(.semibold).foregroundStyle(.gray).padding(.leading).padding(.bottom, 1)
                Spacer()
                
            }
            HStack{
                Text("Grounding").font(.largeTitle).bold().padding(.leading).padding(.bottom, 10)
                Spacer()
                
            }

            HStack{
                Text("Mana stepnya cok").font(.callout).fontWeight(.semibold).foregroundStyle(.gray).padding(.leading).padding(.trailing)
                Spacer()
            }
            Spacer()
            Button("Practice") {
                        print("Button pressed!")
                    }
            .buttonStyle(BlackButton()).padding(.bottom)
            
        }
    }
}

#Preview {
    CardsDetailsTechniqueView()
}
