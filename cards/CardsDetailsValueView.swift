//
//  CardsDetailsValueView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 12/05/24.
//

import SwiftUI

struct CardsDetailsValueView: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle().frame(width: 393, height: 396, alignment: .top).foregroundStyle(.cardbottomcolor)
                Text("ini gambar")
            }.padding(.bottom)

            HStack(){
                Text("VALUE").font(.caption).fontWeight(.semibold).foregroundStyle(.gray).padding(.leading).padding(.bottom, 1)
                Spacer()
                
            }
            HStack{
                Text("Kind").font(.largeTitle).bold().padding(.leading).padding(.bottom, 10)
                Spacer()
                
            }

            HStack{
                Text("I want to be kinder to myself and other people. I realized that I have been quite harsh to myself. Perhaps also the reason why I wasn’t that gentle to others either.").font(.callout).fontWeight(.semibold).foregroundStyle(.gray).padding(.leading).padding(.trailing)
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
    CardsDetailsValueView()
}
