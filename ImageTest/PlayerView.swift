//import SwiftUI
//
//struct PlayerView: View {
//    let player: Player
//    @State var deck: Deck
//    
//    init(player: Player, deck: Deck) {
//        self.player = player
//        self._deck = State(initialValue: deck)
//    }
//    
//    var body: some View {
//        self.deck.shuffle()
//        let newCard = self.deck.deal()!
//        self.player.receiveCard(card: newCard)
//        
//        VStack {
//            ForEach(player.hand, id: \.self) { card in
//                  card.image
//            }
//        }
//    }
//}
//
//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView(player: Player(), deck: Deck())
//    }
//}
//
