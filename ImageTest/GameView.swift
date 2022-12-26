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
      Text("Player Hand: \(viewModel.playerHandTotal)")
      Text("Dealer Hand: \(viewModel.dealerHandTotal)")
        Text("Blackjack: \(String(viewModel.blackJack))")
      Button(action: {
        self.viewModel.hit()
      }) {
        Text("Hit")
      }
      Button(action: {
        self.viewModel.stand()
      }) {
        Text("Stand")
      }
    }
  }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(game: Game(player: Player(), dealer: Player(), deck: Deck(numberOfDecks: 6))))
    }
}
