//
//  SettingsViewModel.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/11/24.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var selectedPlatform: Platform {
        didSet {
            UserDefaults.standard.set(selectedPlatform.rawValue, forKey: "selectedPlatform")
        }
    }
    @Published var isCrossplayEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isCrossplayEnabled, forKey: "isCrossplayEnabled")
        }
    }

    init() {
        selectedPlatform = Platform(rawValue: UserDefaults.standard.string(forKey: "selectedPlatform") ?? "PlayStation") ?? .playstation
        isCrossplayEnabled = UserDefaults.standard.bool(forKey: "isCrossplayEnabled")
    }
}


enum Platform: String, CaseIterable, Identifiable {
    case playstation = "PlayStation"
    case xbox = "Xbox"
    case pc = "PC"
    
    var id: String { self.rawValue }
    
    var image: Image {
            switch self {
            case .playstation:
                return Image("ps-logo")
            case .xbox:
                return Image("xbox-logo")
            case .pc:
                return Image("pc") 
            }
        }
}
