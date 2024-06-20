//
//  ContentView.swift
//  Memorize
//
//  Created by Aziza Rahimova on 18/06/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🧟","🧳","🥰","👻","🤓","🍚","🥗","📚","🛬","😇","👍"]  //Array<String> can be also written as [String]
    
    
    var body: some View {
            ScrollView{
            cards
        }
           
        .padding()
       
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            ForEach(emojis.indices, id: \.self) {i in
                CardView(content:emojis[i])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
}

#Preview {
    ContentView()
}


struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true /*
                                       if -> var isFaceUp: Bool -> then i must give it a value when calling this view
                                       if -> var isFaceUp: Bool = false -> when we give it default value, it is not mandatory to give it a value, but still can call this argument if i want
                                       */
    
    var body: some View{
        ZStack {
            /// Base is rounded rectangle background for cardView
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
            /*
             Error: Cannot assign to property: 'self' is immutable
             Solution: Adding @State to variable can help to resolve the issue
             */
        }
    }
}
