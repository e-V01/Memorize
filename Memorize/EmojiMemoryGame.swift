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
   //static let emojis = ["๐ฒ", "๐", "๐", "๐", "๐", "๐๏ธ", "๐", "๐", "๐", "โ๏ธ", "๐", "โต๏ธ", "๐ธ", "๐ถ", "๐", "๐๏ธ", "๐บ", "๐ ", "๐ต", "๐", "๐", "๐", "๐ป", "๐" ]
    static var themes: Array<Theme> = [
        Theme(
        name: "Vehicles",
        emojis: ["๐ฒ", "๐", "๐", "๐", "๐", "๐๏ธ", "๐", "๐", "๐", "โ๏ธ", "๐", "โต๏ธ", "๐ธ", "๐ถ", "๐", "๐๏ธ", "๐บ", "๐ ", "๐ต", "๐", "๐", "๐", "๐ป", "๐" ],
        numberOfPairsOfCards: 5,
        color: "red"
    ),
        Theme(
        name: "Animals",
        emojis: ["๐ถ","๐ฑ","๐ป","๐ฐ","๐ผ","๐","๐ข","๐ช","๐ฌ","๐ฆ","๐ฆ","๐","๐ฎ","๐ฟ๏ธ","๐ฆ","๐","๐","๐","๐ธ","๐","๐ฆ","๐ณ","๐","๐","๐ฆ","๐ฆ","๐ฆ","๐","๐ฆ","๐"],
        numberOfPairsOfCards: 8,
        color: "orange"
    ),
        Theme(
        name: "Plants",
        emojis:["๐ต","๐ณ","๐","๐","๐","๐ด","๐ธ","๐ผ","๐","๐ฒ","๐ป","๐ชจ","๐","๐ฟ","๐ฑ","๐","๐ชน","โ๏ธ","๐พ","๐ชธ","๐ชต","โ๏ธ","๐ฅฌ","๐ชด","๐ชท","๐น","๐บ","๐ท","๐","๐ฅ"],
        numberOfPairsOfCards: 10,
        color: "green"
    ),
        Theme(
        name: "Faces",
        emojis: ["๐","๐","๐","๐","๐","๐ฅน","๐","๐","๐คฃ","๐ฅฒ","โบ๏ธ","๐","๐","๐","๐","๐","๐","๐","๐ฅฐ","๐","๐","๐คช","๐คจ","๐ง","๐ค","๐","๐ฅธ","๐คฉ","๐ฅณ","๐ฅบ"],
        numberOfPairsOfCards: 8,
        color: "yellow"
    ),
        Theme(
        name: "Sports",
        emojis: ["โฝ๏ธ","๐","๐","โพ๏ธ","๐ฅ","๐พ","๐","๐","๐ฅ","๐ฑ","๐ช","๐","๐ธ","๐","๐","๐ฅ","๐","๐ช","๐ฅ","โณ๏ธ","๐ช","๐","๐น","๐ฃ","๐คฟ","๐ฅ","๐ฅ","๐ฝ","๐น","๐"],
        numberOfPairsOfCards: 8,
        color: "blue"
    ),
        Theme(
        name: "Flags",
        emojis: ["๐ณ๏ธ","๐","๐ฉ","๐ด","๐ดโโ ๏ธ","๐บ๐ณ","๐ธ๐พ","๐น๐ผ","๐น๐ฏ","๐น๐ฟ","๐น๐ญ","๐น๐ฑ","๐น๐ฌ","๐น๐ฐ","๐น๐ด","๐น๐น","๐น๐ณ","๐น๐ท","๐น๐ฒ","๐น๐จ","๐น๐ป","๐บ๐ฌ","๐บ๐ฆ","๐ฆ๐ช","๐ด๓ ง๓ ข๓ ณ๓ ฃ๓ ด๓ ฟ","๐ด๓ ง๓ ข๓ ท๓ ฌ๓ ณ๓ ฟ","๐บ๐ธ","๐ฌ๐ง","๐ด๓ ง๓ ข๓ ฅ๓ ฎ๓ ง๓ ฟ","๐ป๐ฎ"],
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
