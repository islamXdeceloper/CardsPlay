//
//  Concertration.swift
//  Concentration
//
//  Created by Eslam Ahmed on 3/3/18.
//  Copyright © 2018 Eslam Ahmed. All rights reserved.
//

import Foundation


struct  Concentration {
    //array of cards empty array private(set) this responsile for that facedUp()
    private(set) var cards = [Card]()
   private var indexOfOneAndOnlyFaceUpCard: Int? {
        
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
           
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//
//            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp  = (index == newValue)
            }
        }
        
        
    }
    //choose card to doing something here
    
    mutating func choossCard(at index: Int) {
        
        assert(cards.indices.contains(index), "Concentration.choossCard(at: \(index)): chosen index not it the cards")
        if !cards[index].isMatched {
                    //3 cases here that can happen
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true

            } else {
                   indexOfOneAndOnlyFaceUpCard = index

                //either no cards or 2 cards are face up
            }

        }

    }
    
    
    init(numberOfPairsOfCard: Int) {
        //for crashs
        assert(numberOfPairsOfCard > 0, "Concentration.init(at: \(numberOfPairsOfCard)): you must have at least one pair of cards")

        for _ in 0...numberOfPairsOfCard{
        let card = Card()
        
        cards += [card, card]
    }
        // TOOOO: Shuffle the cards
        // HomeWork can i do it some arrays and strings and extra things 
        
        
    }
}





extension Collection {
    
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
    
    
}
