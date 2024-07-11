//
//  HistoryViewViewModel.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/9/24.
//

import Foundation
import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var history: [Lobby] = []

    func addLobby(_ lobby: Lobby) {
        if history.count >= 10 {
            history.removeFirst()
        }
        history.append(lobby)
    }
    
    func clearHistory() {
        history.removeAll()
    }
}
