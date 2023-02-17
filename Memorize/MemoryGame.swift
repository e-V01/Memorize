//
//  MemoryGame.swift
//  Memorize
//
//  Created by Y K on 28.02.2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add NumbersOfPaidsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()// 13 task
    }

    
    private(set) var cards: Array<Card>
    
    private(set) var score = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        //     if let chosenIndex = index(of: card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].hasAlreadyBeenSeen || cards[potentialMatchIndex].hasAlreadyBeenSeen { //15task
                        score -= 1
                    }
                }
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].isFaceUp = false
                        cards[index].hasAlreadyBeenSeen = true // 15 task
                    }
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                
                cards[chosenIndex].isFaceUp.toggle()
            }
            print("\(cards)")
        }
    }
        //    func index(of card: Card) -> Int? {
        //      for index in 0..<cards.count {
        //        if cards[index].id == card.id {
        //          return index
        //    }
        //}
        // return nil
        //}
        
       // init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    //    cards = Array<Card>()
        // add NumbersOfPaidsOfCards x 2 cards to cards array
     //   for pairIndex in 0..<numberOfPairsOfCards {
     //       let content = createCardContent(pairIndex)
     //       cards.append(Card(content: content, id: pairIndex*2))
      //      cards.append(Card(content: content, id: pairIndex*2+1))
            
   //     }
   //     cards.shuffle()// 13 task
 //   }
    
        
        struct Card: Identifiable {
            var isFaceUp: Bool = false
            var isMatched: Bool = false
            var hasAlreadyBeenSeen = false
            var content: CardContent
            var id: Int
            
            
            
        }
}

