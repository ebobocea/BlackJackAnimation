//
//  GameView.swift
//  ImageTest
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            PlayerView(player: viewModel.game.dealer )
                .padding(5)
            Text("Dealer Hand: \(viewModel.dealerHandTotal)")
            Spacer()
            Text("Blackjack: \(String(viewModel.blackJack))")
            Spacer()
            Text("Player Hand: \(viewModel.playerHandTotal)")
            PlayerView(player: viewModel.game.player )
                .padding(5)
            HStack{
                Button(action: {
                    withAnimation{
                        self.viewModel.hit()
                    }
                }) {
                    Text("Hit")
                }
                .padding()
                Spacer()
                Button(action: {
                        self.viewModel.resetGame()
                    
                }){
                    Text("New game")
                }
                Spacer()
                Button(action: {
                    withAnimation{
                        self.viewModel.stand()
                    }
                }) {
                    Text("Stand")
                }
                .padding()
            }
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(game: Game(player: Player(), dealer: Player(), deck: Deck(numberOfDecks: 6))))
    }
}
