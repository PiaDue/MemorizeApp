//
//  ContentView.swift
//  Memorize
//
//  Created by Pia Dünow on 30.09.22.
//

import SwiftUI

struct ContentView: View { //behaves like a view
    var body: some View { //body view
        return ZStack(content: {
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 4)
                .foregroundColor(.red)
            
            Text("Hello world!")
                .foregroundColor(Color.blue)
        })
        .padding()
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
