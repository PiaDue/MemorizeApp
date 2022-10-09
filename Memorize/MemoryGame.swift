//
//  MemoryGame.swift
//  Memorize
//
//  Created by Pia Dünow on 06.10.22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{ //enables ==
    private(set) var cards: Array<Card>
    private var indexOfFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
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
                indexOfFaceUpCard = nil
            }else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfFaceUpCard = chosenIndex
            }
            //turn chosen card face-up
            cards[chosenIndex].isFaceUp.toggle()
        }
        
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
