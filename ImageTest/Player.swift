//
//  Player.swift
//  ImageTest
//
//  Created by Elisei Bobocea on 21/12/2022.
//

import SwiftUI

class Player: ObservableObject, Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.hand == rhs.hand && lhs.score == rhs.score
    }
    

    @Published var hand: [Card]
    @Published var score: Int
    
    init() {
        self.hand = []
        self.score = 0
    }
    
    
    func receiveCard(card: Card) {
        self.hand.append(card)
        //self.hand.insert(card, at: 0)
    }
    
    func hasBlackjack() -> Bool{
        for card in hand {
            if card.rank == .ace && score == 21{
                return true
            }
        }
        return false
    }
    
    func calculateScore() {
        var numAces = 0
        self.score = 0
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
    }
}
