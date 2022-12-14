//
//  EmijiMemoryGame.swift
//  Memorize
//
//  Created by Pia DΓΌnow on 06.10.22.
//

import SwiftUI //as it is part of the UI

class EmojiMemoryGame: ObservableObject { //to pronounde changes
    typealias Card = MemoryGame<String>.Card //new name for this complex type
    
    private static let emojis = ["π", "π", "π", "π", "π", "π", "π", "π", "π", "βοΈ", "π", "β΅οΈ", "πΈ", "πΆ", "π", "π", "πΊ", "π ", "π΅", "π²", "π", "π", "π΄", "π»"]
    
    @Published private var model = createMemoryGame() //vm pusblishes all changes on model
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    var cards: Array<Card>{
        return model.cards
    }
    
    //MARK: - Intents
    
    func choose(_ card: Card){
        model.choose(card)
    }
}

