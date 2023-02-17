//
//  ContentView.swift
//  Memorize
//  MARK: - Array = $24vehicles: ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝" ]
//  Created by Y K on 17.02.2023.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    var body: some View {
        // Text("Memorize!").font(.largeTitle)
        VStack {
            HStack {
                Text(viewModel.themeName).font(.largeTitle)
                Spacer()
                Text("Score: \(viewModel.score)").font(.largeTitle)
            } //14 task
            .padding()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor) //task 14, hints 5,6
            .padding(.horizontal)
     //   }
     //   Spacer()
     //   HStack (alignment: .bottom, spacing: 50){
            //               vehiclesButton
            //             plantsButton
            //           animalsButton
      //  }
       // .font(.subheadline)
        //       .padding(.horizontal)
       // .padding(.horizontal)
        
        Button {
            viewModel.newGame()
        } label: {
            Text("New Game").font(.largeTitle) // 14 task
        }
    }
}
}
    // var vehiclesArray = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝" ]
    // var vehiclesButton: some View {
    //     Button {
    //          emojiCount = vehiclesArray.count
    //          emojis = vehiclesArray.shuffled()
    //      } label: {
    //          VStack {
    //              Image(systemName: "car.side").font(.largeTitle)
    //             Text("Vehicles")
    //       }
    // }
    //}
    //  var plantsArray = ["🌵","🌳","🍂","🍀","🍄","🌴","🌸","🌼","🎋","🌲","🌻","🪨","🎍","🌿","🌱","🐚","🪹","☀️","🌾","🪸","🪵","☘️","🥬","🪴","🪷","🌹","🌺","🌷","💐","🥀"]
    
    //  var plantsButton: some View {
    //    Button {
    //         emojiCount = plantsArray.count
    //         emojis = plantsArray.shuffled()
    //     } label: {
    //         VStack {
    //             Image(systemName: "leaf").font(.largeTitle)
    //           Text("Plants")
    //         }
    //     }
    //   }
    //   var animalsArray = ["🐶","🐱","🐻","🐰","🐼","🙉","🐢","🐪","🐬","🦓","🦊","🐝","🐮","🐿️","🦔","🐁","🐟","🐓","🐸","🐙","🦞","🐳","🐌","🐊","🦀","🦒","🦉","🐏","🦃","🐆"]
    
    
    //   var animalsButton: some View {
    //       Button {
    //         emojiCount = animalsArray.count
    //         emojis = animalsArray.shuffled()
    //       } label: {
    //          VStack {
    //              Image(systemName: "pawprint").font(.largeTitle)
    //              Text("Animals").allowsTightening(true)
    //          }
    //      }
    //   }
    
    //   }
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20.0)
                if card.isFaceUp {
                    shape.fill(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(.largeTitle)
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
            ContentView(viewModel: game)
                .preferredColorScheme(.light)
        }
    }

