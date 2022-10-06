//
//  ContentView.swift
//  Memorize
//
//  Created by Pia Dünow on 30.09.22.
//

import SwiftUI

struct ContentView: View { //behaves like a view
    let viewModel: EmojiMemoryGame
    
    var body: some View { //body view
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){ //Grid of Cards
                    ForEach(viewModel.cards, content: { card in //parameter
                        CardView(card: card)//initial value for that card specifically
                            .aspectRatio(2/3, contentMode:.fit)
                    })
                }
                .padding()
                .foregroundColor(.red)
            }
        }
    }
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 23) //local constant, no need to specify the type
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 4)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
                
        }
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
