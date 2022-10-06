//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Pia Dünow on 30.09.22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() //uses free init
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
