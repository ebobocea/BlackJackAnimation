//
//  Player.swift
//  ImageTest
//
//  Created by Elisei Bobocea on 21/12/2022.
//

import SwiftUI

class Player: ObservableObject {
    @Published var hand: [Card]

    init() {
        self.hand = []

    }
    
    func receiveCard(card: Card) {
        self.hand.append(card)
        //self.hand.insert(card, at: 0)
    }
    
    func hasBlackjack() -> Bool{
        for card in hand {
            if card.rank == .ace && calculateScore() == 21{
                return true
            }
        }
        return false
    }
    
    func calculateScore() -> Int{
        var numAces = 0
        var score = 0
        for card in hand {
            if card.rank == .ace {
                numAces += 1
            } else {
                    score += card.rank.setValue
            }
        }
        for _ in 0..<numAces {
            if score + 11 > 21 {
                score += 1
            } else {
                score += 11
            }
        }
        return score
    }
    
    func isBust() -> Bool{
        return calculateScore() > 21
    }
}
