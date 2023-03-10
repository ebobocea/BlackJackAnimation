import SwiftUI

struct PlayerView: View {
    @ObservedObject var player: Player
    
    init(player: Player) {
        self.player = player
    }
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive (minimum: 100), spacing: -70)]) {
            ForEach(player.hand) { card in
                CardView(image: card.image)
                    .transition(.offset(x: 50, y: 0))
            }
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: Player())
    }
}

