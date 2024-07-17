//
//  CardView.swift
//  Memorize
//
//  Created by Aziza Rahimova on 16/07/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View{
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1,contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    private struct Constants{
        static let inset: CGFloat = 5
        struct FontSize{
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest/largest
        }
        struct Pie{
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
    
}


struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    
    static var previews:  some View{
        VStack{
            HStack{
                CardView(Card(id: "test1",isFaceUp: true, content: "X"))
                CardView(Card(id: "test1", content: "X"))
            }
            HStack{
                CardView(Card(id: "test1",isFaceUp: true, isMatched: true, content: "This is the very long text that should fit inside"))
                CardView(Card(id: "test1", isMatched: true, content: "X"))
            }
        }
        .padding()
        .foregroundColor(.green)
    }
}
