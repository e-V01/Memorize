//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Y K on 17.02.2023.
//

import SwiftUI


@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
