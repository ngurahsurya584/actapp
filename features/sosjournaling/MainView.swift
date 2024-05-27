//
//  MainView.swift
//  actapp
//
//  Created by I Gusti Ngurah Surya Ardika Dinataputra on 17/05/24.
//

import SwiftUI

struct MainView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.darkGray

        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = .white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        itemAppearance.selected.iconColor = .yellow
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.yellow]

        appearance.stackedLayoutAppearance = itemAppearance

        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }

    var body: some View {
        NavigationStack{
            TabView {
                JournalingView()
                    .tabItem {
                        Label("Home", systemImage: "leaf.fill")
                    }

                CobaInsightsView()
                    .tabItem {
                        Label("Insights", systemImage: "tree.fill")
                    }
            }
            .navigationBarBackButtonHidden()
        }
       
    }
}

#Preview {
    MainView()
        .environmentObject(PersonValue())
        .environmentObject(MorningJournalingDataController())
        
}
