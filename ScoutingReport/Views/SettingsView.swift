//
//  SettingsView.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/9/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedPlatformIndex = UserDefaults.standard.integer(forKey: "selectedPlatformIndex")
    @StateObject private var viewModel = SettingsViewModel()
    

    
    var body: some View {
        VStack {
            VStack {
                Text("Select Your Platform")
                    .font(.headline)
                HStack {
                    ZStack { // playstation button
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 75, height: 75)
                            .foregroundColor(selectedPlatformIndex == 0 ? .blue : .gray)
                        Image("ps-logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                    .padding(5)
                    .onTapGesture {
                        selectedPlatformIndex = 0
                        viewModel.selectedPlatform = .playstation
                        UserDefaults.standard.set(selectedPlatformIndex, forKey: "selectedPlatformIndex")
                    }

                    ZStack { // xbox button
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 75, height: 75)
                            .foregroundColor(selectedPlatformIndex == 1 ? .green : .gray)
                        Image("xbox-logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                    .padding(5)
                    .onTapGesture {
                        selectedPlatformIndex = 1
                        viewModel.selectedPlatform = .xbox
                        UserDefaults.standard.set(selectedPlatformIndex, forKey: "selectedPlatformIndex")
                    }

                    ZStack { //
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 75, height: 75)
                            .foregroundColor(selectedPlatformIndex == 2 ? .red : .gray)
                        Image("pc")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                    .padding(5)
                    .onTapGesture {
                        selectedPlatformIndex = 2
                        viewModel.selectedPlatform = .pc
                        UserDefaults.standard.set(selectedPlatformIndex, forKey: "selectedPlatformIndex")
                    }
                }
            }
            .padding()

            if viewModel.selectedPlatform != .pc {
                VStack {
                    Text("Crossplay Activated?")
                        .font(.headline)
                        .padding(.bottom, 20)
                    Toggle(isOn: $viewModel.isCrossplayEnabled) {
                        Text(viewModel.isCrossplayEnabled ? "On" : "Off")
                    }
                    .toggleStyle(SwitchToggleStyle())
                }
                .padding()
            }

            Spacer()
        }
        .padding()
    }
}

            
#Preview {
    SettingsView()
}


//struct SettingsView: View {
//@State private var selectedIndex = 0
//@StateObject private var viewModel = SettingsViewModel()
//
//var body: some View {
//    VStack {
//        VStack {
//            Text("Select Your Platform")
//                .font(.headline)
//            CustomSegmentedControl(selectedIndex: $selectedIndex, platforms: Platform.allCases, selectionColors: [.blue, .green, .red])
//        }
//        .padding()
//
//        if viewModel.selectedPlatform != .pc {
//            VStack {
//                Text("Crossplay Activated?")
//                    .font(.headline)
//                    .padding(.bottom, 20)
//                Toggle(isOn: $viewModel.isCrossplayEnabled) {
//                    Text(viewModel.isCrossplayEnabled ? "On" : "Off")
//                }
//                .toggleStyle(SwitchToggleStyle())
//            }
//            .padding()
//        }
//
//        Spacer()
//    }
//    .padding()
//}
//}
