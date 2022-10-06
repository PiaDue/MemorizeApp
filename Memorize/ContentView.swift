//
//  ContentView.swift
//  Memorize
//
//  Created by Pia Dünow on 30.09.22.
//

import SwiftUI

struct ContentView: View { //behaves like a view
    var emojis:[String] = ["🚗", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚲", "🚚", "🚆", "🛴", "🛻"]
    @State var emojiCount: Int = 8 //saved in memory
    
    var body: some View { //body view
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){ //Grid of Cards
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in //parameter
                        CardView(content: emoji)//initial value for that card specifically
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
    var content: String
    @State var isFaceUp: Bool = true //points to property in memory
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 23) //local constant, no need to specify the type
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 4)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
                
        }
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp //flip card
        })
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
