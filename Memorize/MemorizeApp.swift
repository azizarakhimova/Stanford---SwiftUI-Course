//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Aziza Rahimova on 18/06/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
