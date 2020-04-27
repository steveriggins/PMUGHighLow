//
//  Game.swift
//  PMUGHighLow
//
//  Created by Steven W. Riggins on 4/18/20.
//  Copyright © 2020 Steven W. Riggins. All rights reserved.
//

import Foundation
import Combine

class Game: ObservableObject {
    
    @Published var gameState: GameState = .newGame
    
    enum GameState {
        case newGame
        case guessedTooHigh
        case guessedTooLow
        case guessedCorrectly
    }
    
    init() {
        newGame()
    }
    
    func guess(_ guess: String) {
        guard let guessValue = Int(guess) else { return }
        
        if guessValue > winningValue {
            gameState = .guessedTooHigh
        } else if guessValue < winningValue {
            gameState = .guessedTooLow
        } else {
            gameState = .guessedCorrectly
        }
    }
    
    func newGame() {
        winningValue = Int.random(in: 1...10)
        gameState = .newGame
    }
    
    private var winningValue: Int = 0
}
