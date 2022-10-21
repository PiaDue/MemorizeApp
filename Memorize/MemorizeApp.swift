//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Pia Dünow on 30.09.22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame() //uses free init
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
