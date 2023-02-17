//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Y K on 28.02.2023.
//

import SwiftUI

class EmojiMemoryGame:ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()! // task 11
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
   //static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝" ]
    static var themes: Array<Theme> = [
        Theme(
        name: "Vehicles",
        emojis: ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝" ],
        numberOfPairsOfCards: 5,
        color: "red"
    ),
        Theme(
        name: "Animals",
        emojis: ["🐶","🐱","🐻","🐰","🐼","🙉","🐢","🐪","🐬","🦓","🦊","🐝","🐮","🐿️","🦔","🐁","🐟","🐓","🐸","🐙","🦞","🐳","🐌","🐊","🦀","🦒","🦉","🐏","🦃","🐆"],
        numberOfPairsOfCards: 8,
        color: "orange"
    ),
        Theme(
        name: "Plants",
        emojis:["🌵","🌳","🍂","🍀","🍄","🌴","🌸","🌼","🎋","🌲","🌻","🪨","🎍","🌿","🌱","🐚","🪹","☀️","🌾","🪸","🪵","☘️","🥬","🪴","🪷","🌹","🌺","🌷","💐","🥀"],
        numberOfPairsOfCards: 10,
        color: "green"
    ),
        Theme(
        name: "Faces",
        emojis: ["😀","😃","😄","😁","😆","🥹","😅","😂","🤣","🥲","☺️","😊","😇","🙂","🙃","😉","😌","😍","🥰","😘","😝","🤪","🤨","🧐","🤓","😎","🥸","🤩","🥳","🥺"],
        numberOfPairsOfCards: 8,
        color: "yellow"
    ),
        Theme(
        name: "Sports",
        emojis: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🏑","🥍","🏏","🪃","🥅","⛳️","🪁","🛝","🏹","🎣","🤿","🥊","🥋","🎽","🛹","🏂"],
        numberOfPairsOfCards: 8,
        color: "blue"
    ),
        Theme(
        name: "Flags",
        emojis: ["🏳️","🏁","🚩","🏴","🏴‍☠️","🇺🇳","🇸🇾","🇹🇼","🇹🇯","🇹🇿","🇹🇭","🇹🇱","🇹🇬","🇹🇰","🇹🇴","🇹🇹","🇹🇳","🇹🇷","🇹🇲","🇹🇨","🇹🇻","🇺🇬","🇺🇦","🇦🇪","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🏴󠁧󠁢󠁷󠁬󠁳󠁿","🇺🇸","🇬🇧","🏴󠁧󠁢󠁥󠁮󠁧󠁿","🇻🇮"],
        numberOfPairsOfCards: 8,
        color: "purple"
    ),
    ]

    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
   @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "orange":
            return .orange
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "blue":
            return .blue
        case "purple":
            return .purple
        default:
            return .black
        }
    }
    
    var themeName: String {
        return theme.name
    }
    
    var score: Int {
        return model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()! // task 11
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
