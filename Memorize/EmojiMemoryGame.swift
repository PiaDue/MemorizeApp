//
//  EmijiMemoryGame.swift
//  Memorize
//
//  Created by Pia Dünow on 06.10.22.
//

import SwiftUI //as it is part of the UI

class EmojiMemoryGame: ObservableObject { //to pronounde changes
    static let emojis = ["🚗", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚲", "🚚", "🚆", "🛴", "🛻"]
    
    @Published private var model: MemoryGame<String> = createMemoryGame() //vm pusblishes all changes on model
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}

