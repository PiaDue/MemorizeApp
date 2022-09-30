//
//  ContentView.swift
//  Memorize
//
//  Created by Pia Dünow on 30.09.22.
//

import SwiftUI

struct ContentView: View { //behaves like a view
    var emojis:[String] = ["🚗", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚲", "🚚", "🚆", "🛴", "🛻"]
    @State var emojiCount: Int = 4 //saved in memory
    
    var body: some View { //body view
        VStack{
            
            HStack{ //horizontal Stack of cards
                ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in //parameter
                    CardView(content: emoji)//initial value for that card specifically
                })
            }
            .padding()
            .foregroundColor(.red)
            
            HStack{
                addCard
                Spacer()
                removeCard
            }
            .padding(.horizontal)
            .font(.largeTitle)
            
        }
        
    }
    
    var addCard: some View{
        Button(action: {
            if(emojiCount<emojis.count){emojiCount+=1}
        }, label: {
            Image(systemName: "plus.circle")
            
        })
    }
    
    var removeCard: some View{
        Button(action: {
            if(emojiCount>1){emojiCount-=1}
        }, label: {
            Image(systemName: "minus.circle")
            
        })
    }
}

struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = false //points to property in memory
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 25) //local constant, no need to specify the type
            
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
    }
}
