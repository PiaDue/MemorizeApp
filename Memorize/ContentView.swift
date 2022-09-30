//
//  ContentView.swift
//  Memorize
//
//  Created by Pia Dünow on 30.09.22.
//

import SwiftUI

struct ContentView: View { //behaves like a view
    var emojis:[String] = ["✈️", "🚲", "🚗", "🛵"]
    
    var body: some View { //body view
        return HStack{
            ForEach(emojis, id: \.self, content: { emoji in //parameter
                CardView(content: emoji)//initial value for that card specifically
            })
        }
        .padding()
        .foregroundColor(.red)
        
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
            .preferredColorScheme(.dark)
    }
}
