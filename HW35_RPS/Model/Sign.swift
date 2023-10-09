//
//  Sign.swift
//  HW35_RPSGame
//
//  Created by Dawei Hao on 2023/10/7.
//

import Foundation

// MARK: - Define Mode for play
enum Sign {
    case rock
    case paper
    case scissors

    var emoji: String {
        switch self {
            case.rock:
                return "✊🏻"
            case.paper:
                return "🖐🏻"
            case .scissors:
                return "✌🏻"
        }
    }
}
