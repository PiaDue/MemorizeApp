//
//  EmijiMemoryGame.swift
//  Memorize
//
//  Created by Pia Dünow on 06.10.22.
//

import SwiftUI //as it is part of the UI



class EmojiMemoryGame {
    static let emojis = ["🚗", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚲", "🚚", "🚆", "🛴", "🛻"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
}


