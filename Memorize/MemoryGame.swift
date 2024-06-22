//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Aziza Rahimova on 20/06/24.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        
        //add numbersOfPairsOfCards x 2cards
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))

        }
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
    
}
