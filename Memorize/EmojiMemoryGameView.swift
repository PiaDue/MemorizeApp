//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Pia Dünow on 30.09.22.
//

import SwiftUI

struct EmojiMemoryGameView: View { //behaves like a view
    @ObservedObject var game: EmojiMemoryGame //rebuilds when vm pronounces changes
    
    var body: some View { //body view
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){ //Grid of Cards
                ForEach(game.cards, content: { card in //parameter
                    CardView(card: card)//initial value for that card specifically
                        .aspectRatio(2/3, contentMode:.fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                })
            }
            .padding()
            .foregroundColor(.red)
        }
    }
}

struct CardView: View{
    let card: EmojiMemoryGame.Card
    
    var body: some View{
        GeometryReader(content: { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: ViewConstants.cornerRadius) //local constant, no need to specify the type
                
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: ViewConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size)) //adapts the emoji size to the size of the card
                }else if card.isMatched{
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
            
        })
    }
    
    private func font(in size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * ViewConstants.fontScale)
    }
    
    // make constants in the code more readale + gathers them at one pace
    private struct ViewConstants {
        static let cornerRadius: CGFloat = 23
        static let lineWidth: CGFloat = 4
        static let fontScale: CGFloat = 0.75
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
