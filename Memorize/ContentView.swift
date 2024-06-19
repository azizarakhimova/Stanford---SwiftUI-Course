//
//  ContentView.swift
//  Memorize
//
//  Created by Aziza Rahimova on 18/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

#Preview {
    ContentView()
}


struct CardView: View {
    
    @State var isFaceUp: Bool = false /*
                                if -> var isFaceUp: Bool -> then i must give it a value when calling this view
                                if -> var isFaceUp: Bool = false -> when we give it default value, it is not mandatory to give it a value, but still can call this argument if i want
                                */
    
    var body: some View{
        ZStack {
            /// Base is rounded rectangle background for cardView
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            } else{
                base
            }
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
