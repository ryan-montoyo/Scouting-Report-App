//
//  MainView.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/9/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
            ScoutView()
                .tabItem {
                    Label("Scout", systemImage: "magnifyingglass")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainView()
}
