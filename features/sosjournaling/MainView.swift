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
                       Label("Home", systemImage: "house.fill")
                        
                    }
                
              InsightsView()
                    .tabItem{
                        Label("Insights", systemImage: "heart.text.square.fill")
                    }
                    
                
            }
        }
        .navigationBarBackButtonHidden()
       
        
        
        
    }
}

#Preview {
    MainView()
}
