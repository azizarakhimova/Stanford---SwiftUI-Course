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
    private let spacing: CGFloat = 4
    
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
                        .padding(spacing)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
        }
        .foregroundColor(viewModel.color)
    }
   
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}


