//
//  GameView.swift
//  PMUGHighLow
//
//  Created by Steven W. Riggins on 4/18/20.
//  Copyright © 2020 Steven W. Riggins. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @State var currentGuess = ""
    @ObservedObject var game: Game
    
    var body: some View {
        Form {
            Text("Guess Higher or Lower!")
            TextField("Enter Guess", text: $currentGuess,
                      onEditingChanged: { _ in },
            onCommit: {})
            
            if game.gameState == .guessedCorrectly {
                Button("New Game") {
                    self.game.newGame()
                }
            } else {
                Button("Make Guess") {
                    self.game.guess(self.currentGuess)
                }
                .disabled(currentGuess.isEmpty)
            }
            
            Text(gameClue())
        }
    }
    
    func gameClue() -> String {
        switch game.gameState {
        case .newGame:
            return "Guess a number between 1 and 10"
        case .guessedTooLow:
            return "Guess Higher!"
        case .guessedTooHigh:
            return "Guess lower!"
        case .guessedCorrectly:
            return "You won!"
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game()
        return GameView(game: game)
    }
}
