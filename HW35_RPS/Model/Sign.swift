//
//  Sign.swift
//  HW35_RPSGame
//
//  Created by Dawei Hao on 2023/10/7.
//

import Foundation

func randomSign () -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}


// MARK: - Define Mode for play
enum Sign {
    case rock
    case paper
    case scissors

    var emoji: String {
        switch self {
            case .paper:
                return "🖐🏻"
            case .rock:
                return "✊🏻"
            case .scissors:
                return "✌🏻"
        }
    }
    
    func gameState(against opponentSign: Sign) -> GameState {

        // Define draw situation
        if self == opponentSign {
            return .draw
        }
            switch self {

        // Define win situation
            case.rock:
                    if opponentSign == .scissors { return .win }
            case.paper:
                    if opponentSign == .rock { return .win }
            case .scissors:
                    if opponentSign == .paper { return .win }
            }
            return .loose
        }
    }
