//
//  GameState.swift
//  HW35_RPSGame
//
//  Created by Dawei Hao on 2023/10/11.
//

import UIKit

// Use the enum to create fourth state when you're playing RPS game.
enum GameState {
    case start
    case win
    case loose
    case draw

    // Use the Enum switch function to define the different statment for Game.
    var status: String {
        switch self {
            case .start:
                return "Rock, Paper, Scissors?"
            case .win:
                return "You Won!"
            case .loose:
                return "You lost!"
            case .draw:
                return "It's a draw"
        }
    }
}

