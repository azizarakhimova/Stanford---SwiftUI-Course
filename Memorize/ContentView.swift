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
        }
        .padding()
        .foregroundColor(.orange)
    }
}

#Preview {
    ContentView()
}


struct CardView: View {
    
    var isFaceUp: Bool = false /*
                                if -> var isFaceUp: Bool -> then i must give it a value when calling this view
                                if -> var isFaceUp: Bool = false -> when we give it default value, it is not mandatory to give it a value, but still can call this argument if i want
                                */
    
    var body: some View{
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            } else{
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}
