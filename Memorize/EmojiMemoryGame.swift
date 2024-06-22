//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aziza Rahimova on 20/06/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    
    private static let emojis = ["🧟","🧳","🥰","👻","🤓","🍚","🥗","📚","🛬","😇","👍"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame<String>(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis [pairIndex]
            } else{
                return "⁉️"
            }
        }
    }
    
    
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
