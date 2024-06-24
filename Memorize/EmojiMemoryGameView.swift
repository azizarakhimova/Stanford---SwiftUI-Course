//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Aziza Rahimova on 18/06/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack{
            cards
                .animation(.default, value: viewModel.cards)
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
        /*
         .padding()
         .background(Color.yellow) makes full screen yellow
         
         
         .background(Color.yellow)
         .padding() makes only view back yellow
         
         */
    }
    
    var cards: some View{
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) {card in
                    CardView(card)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
        }
        .foregroundColor(.orange)
    }
   
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack {
            /// Base is rounded rectangle background for cardView
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}
