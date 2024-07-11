//
//  MainView.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/9/24.
//

import SwiftUI
import UIKit

struct MainView: View {
    var body: some View {
        ZStack {
            TabView {
                HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
            
            ScoutView()
                .tabItem {
                    Label("Scout", systemImage: "magnifyingglass")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            TestView()
                .tabItem {
                    Label("Test", systemImage: "testtube.2")
                }
            
            }
            .accentColor(.red)

            VStack {
                Spacer()
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 0.2)
                    .foregroundColor(Color(UIColor.systemGray6))
                    .padding(.bottom, 60)
            }
        }
    }
}


#Preview {
    MainView()
}
