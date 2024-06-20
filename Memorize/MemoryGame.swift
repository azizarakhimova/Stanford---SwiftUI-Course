//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Aziza Rahimova on 20/06/24.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    func choose(card: Card){
        
    }
    
    struct Card{
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}