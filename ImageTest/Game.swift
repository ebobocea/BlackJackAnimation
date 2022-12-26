//
//  Game.swift
//  ImageTest
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import Foundation

class Game {
    var player: Player
    var dealer: Player
    var deck: Deck
    
    init(player: Player, dealer: Player, deck: Deck) {
        self.player = player
        self.dealer = dealer
        self.deck = deck
    }
    
    func startNewGame() {
        if !player.hand.isEmpty && !dealer.hand.isEmpty{
            player.hand.removeAll()
            
            dealer.hand.removeAll()
        }
        
        
        // shuffle the deck and deal initial hands to the player and dealer
        deck.shuffle()
        
        player.receiveCard(card: deck.deal()!)
        player.receiveCard(card: deck.deal()!)
        
        dealer.receiveCard(card: deck.deal()!)
        dealer.receiveCard(card: deck.deal()!)
        
        eitherHasBlackJack()
    }
    
    func eitherHasBlackJack() -> Bool{
        if player.hasBlackjack() || dealer.hasBlackjack(){
            stand()
            return true
        }
        return false
    }
    
    func hit(player: Player) {
        // deal a card to the specified hand
        player.receiveCard(card: deck.deal()!)
    }
    
    func stand() {
        
        // while the dealer's hand is below 17, have the dealer hit
        while dealer.calculateScore() < 17 {
            hit(player: dealer)
        }
        
        // determine the winner
        if player.isBust() {
            if dealer.isBust() {
                // both hands are bust, game is a tie
            } else {
                // player is bust, dealer wins
            }
        } else if dealer.isBust() {
            // dealer is bust, player wins
        } else {
            if player.calculateScore() > dealer.calculateScore() {
                // player has higher hand, player wins
            } else if dealer.calculateScore() > player.calculateScore(){
                // dealer has higher hand, dealer wins
            } else {
                // both hands have the same value, game is a tie
            }
        }
    }
}
