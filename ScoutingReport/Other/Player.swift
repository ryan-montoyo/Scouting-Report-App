//
//  Player.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/11/24.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    var gamertag: String
    var is_same_console: Bool
    
    // API stats
    var kd: Double?
    var current_rank: String?
    var current_sr: Double?
    var highest_sr: Double?
    var highest_rank: String?
}
