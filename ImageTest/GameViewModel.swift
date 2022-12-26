//
//  GameViewModel.swift
//  ImageTest
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var playerHandTotal: Int = 0
    @Published var dealerHandTotal: Int = 0
    @Published var blackJack: Bool = false
    @Published var game: Game
    
    init(game: Game) {
        self.game = game
        game.startNewGame()
        playerHandTotal = game.player.calculateScore()
        dealerHandTotal = game.dealer.calculateScore()
        blackJack = game.eitherHasBlackJack()
    }
    
    func resetGame(){
        game.startNewGame()
        playerHandTotal = game.player.calculateScore()
        dealerHandTotal = game.dealer.calculateScore()
        blackJack = game.eitherHasBlackJack()
    }
    
    func hit() {
        game.hit(player: game.player)
        playerHandTotal = game.player.calculateScore()
    }
    
    func stand() {
        game.stand()
        dealerHandTotal = game.dealer.calculateScore()
    }
}
