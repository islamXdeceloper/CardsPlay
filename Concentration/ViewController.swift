//
//  ViewController.swift
//  Concentration
//
//  Created by Eslam Ahmed on 3/1/18.
//  Copyright © 2018 Eslam Ahmed. All rights reserved.
//
import UIKit
class ViewController: UIViewController {
    
   private lazy var game = Concentration(numberOfPairsOfCard: numberOfPairsOfCard)
    
    
    var numberOfPairsOfCard: Int {
   
            return (cardButtons.count+1) / 2
    
    }
    
    //variable count
   private(set) var flipCount = 0 {
        didSet {
            
         updateFlipCountLable()
        }
    }
    
    private func updateFlipCountLable() {
        
        let attributes: [NSAttributedString.Key: Any] = [
            
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLable.attributedText = attributedString
        
    }
    
    
// function do action first button
    @IBOutlet private weak var flipCountLable: UILabel! {
        didSet {
            updateFlipCountLable()
        }
        
    }
    @IBOutlet private var cardButtons: [UIButton]!
   
    @IBAction private func touchCard(_ sender: UIButton) {
//        print("agh! a ghost")
             flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.choossCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card was not in cardButtons")
        }
    }
    
   private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        } else {
            button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
        
    }
   
    }

    private var emojiChoices = "😎🎃👻👿💩💋🎈💚🦄🦁👁🤙🍎👽"
    
    private var emoij = [Card:String]()
   private func emoji(for card: Card) -> String {
        if emoij[card] == nil , emojiChoices.count > 0 {
            // create random index to choose from that an emoji
            //conver all code to Int
            
            
    let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
          
            emoij[card] = String(emojiChoices.remove(at: randomStringIndex))
            
        }
        return emoij[card] ?? "?"
    }
    
}
extension Int{
    var arc4random: Int {
        
        
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
    
    
}
