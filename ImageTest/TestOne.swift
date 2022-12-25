//
//  TestOne.swift
//  ImageTest
//
//  Created by Elisei Bobocea on 16/12/2022.
//

import SwiftUI

struct TestOne: View {
    @ObservedObject var player: Player
    @State private var deck: Deck
    var hasBlackJack = false
    
    init(player: Player, deck: Deck) {
        self.player = player
        self._deck = State(initialValue: deck)
        deck.shuffle()
        player.receiveCard(card: deck.deal()!)
        player.receiveCard(card: deck.deal()!)
        player.calculateScore()
        hasBlackJack = player.hasBlackjack()
    }
    
    var body: some View {
        
        VStack{
            
            Text("\(player.score)")
            Text("\(String(hasBlackJack))")
            
            
            PlayerView(player: player)
                .padding(5)
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)){
                    hitButton()
                }
            }) {
                Text("Hit")
            }
        }
    }
    
    func hitButton(){
        player.receiveCard(card: deck.deal()!)
        player.calculateScore()
    }
}

struct TestOne_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TestOne(player: Player(), deck: Deck(numberOfDecks: 6))
        }
    }
}
