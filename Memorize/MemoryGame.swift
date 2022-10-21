//
//  MemoryGame.swift
//  Memorize
//
//  Created by Pia Dünow on 06.10.22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{ //enables ==
    private(set) var cards: Array<Card>
    private var indexOfFaceUpCard: Int? {
        get{
            let faceUpCardIndicies = cards.indices.filter({cards[$0].isFaceUp}) //array of all faceUpCards
            return faceUpCardIndicies.oneAndOnly //look at arry extension
        }
        set{
            cards.indices.forEach({ index in
                cards[index].isFaceUp = (index == newValue)
            })
        }
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    mutating func choose(_ card: Card){ //mutating because it changes the models data
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),//$0 stands for first parameter
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    //match found
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    //put cards out of game
                }
                cards[chosenIndex].isFaceUp = true
            }else{
                indexOfFaceUpCard = chosenIndex
            }
            
        }
    }
    
    struct Card: Identifiable {
        let id: Int
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}


extension Array { //is now part of the Array struct
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        }else{
            return nil
        }
        
    }
}
