//
//  Theme.swift
//  Memorize
//
//  Created by Y K on 03.03.2023.
//

import Foundation


struct Theme { //3 task
    var name: String
    var emojis: Array<String>
    var numberOfPairsOfCards: Int
    var color: String
    
    init(name: String, emojis: Array<String>, numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count: numberOfPairsOfCards // 7
        self.color = color
    }
}
