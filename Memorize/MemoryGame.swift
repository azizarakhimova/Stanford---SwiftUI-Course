//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Aziza Rahimova on 20/06/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        
        //add numbersOfPairsOfCards x 2cards
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex+1)a", content: content))
            cards.append(Card(id: "\(pairIndex+1)b", content: content))

        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{
            return cards.indices.filter { index in cards[index].isFaceUp }.only
        }
        set{
            return cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0)}
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { cardToCheck in
            cardToCheck.id == card.id
        }){
            
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else{
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                
                
                cards[chosenIndex].isFaceUp = true
                    
            }
          
        }
    }
    
    private func index(of card: Card)-> Int?{
        
        for index in cards.indices {
            if cards[index].id == card.id{
                return index
            }
        }
        
        return nil
    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUp ? "up" : "down")  \(isMatched ? "matched" : "")"
        }
        
        var id: String
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
    
}

extension Array{
    var only: Element?{
        return count == 1 ? first : nil
    }
}
