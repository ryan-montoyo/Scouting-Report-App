//
//  Lobby.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/11/24.
//

import Foundation

struct Lobby: Identifiable {
    let id = UUID()
    var players: [Player]
    var scanDate: Date
}
