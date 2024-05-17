//
//  MainView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 17/05/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack{
            TabView(){
                JournalingHomeView()
                    .tabItem{
                        VStack{
                            HStack{
                                Image(systemName: "laurel.leading")
                                Image(systemName: "laurel.trailing")
                            }
                            Text("Home")
                        }
                        
                    }
                
                
            }
        }
        .navigationBarBackButtonHidden()
       
        
        
        
    }
}

#Preview {
    MainView()
}
