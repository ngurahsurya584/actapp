//
//  CardsDetailsPainView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 12/05/24.
//

import SwiftUI

struct CardsDetailsPainView: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle().frame(width: 393, height: 396, alignment: .top).foregroundStyle(.cardbottomcolor)
                Text("ini gambar")
            }.padding(.bottom)

            HStack(){
                Text("PAIN").font(.caption).fontWeight(.semibold).foregroundStyle(.gray).padding(.leading).padding(.bottom, 1)
                Spacer()
                
            }
            HStack{
                Text("Anger").font(.largeTitle).bold().padding(.leading).padding(.bottom, 10)
                Spacer()
                
            }

            HStack{
                Text("Scalding hot, dense, red bubble in my chest. Could’ve been mistaken as a ball of molten lava, threatening to burn through my chest and pour unforgivingly through me anytime soon.").font(.callout).fontWeight(.semibold).foregroundStyle(.gray).padding(.leading).padding(.trailing)
            }
            Spacer()
            Button("Edit") {
                        print("Button pressed!")
                    }
            .buttonStyle(BlackButton()).padding(.bottom)
            
        }
    }
}

#Preview {
    CardsDetailsPainView()
}
