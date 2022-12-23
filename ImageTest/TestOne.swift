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
    @State private var changed = false
    
    init(player: Player, deck: Deck) {
        self.player = player
        self._deck = State(initialValue: deck)
        deck.shuffle()
        player.receiveCard(card: deck.deal()!)
        player.receiveCard(card: deck.deal()!)
    }
    
    var body: some View {
        
        VStack{
            LazyVGrid(columns: [GridItem(.adaptive (minimum: 100), spacing: -70)]) {
                    ForEach(player.hand) { card in
                        
                        CardView(image: card.image)
                            .transition(.offset(x: changed ? 50 : 0, y: 0))
                            .animation(.easeInOut(duration: 0.5), value: changed)
                    }
            }
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)){
                    player.receiveCard(card: deck.deal()!)
                    changed.toggle()
                }
            }) {
                Text("Hit")
            }
        }
    }
}

struct TestOne_Previews: PreviewProvider {
    static var previews: some View {
        TestOne(player: Player(), deck: Deck(numberOfDecks: 6))
    }
}
