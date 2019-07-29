//
//  CardModel.swift
//  Match App
//
//  Created by Ryan Lilla on 7/27/19.
//  Copyright © 2019 Ryan Lilla. All rights reserved.
//

import Foundation

class CardModel {
    
    
    func getCards() -> [Card] {
        
        // Declare an array to store numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        while generatedNumbersArray.count < 8 {
            
            // Get a random number
            // Range goes from 0...12, so must add one for 1...13
            let randomNumber = arc4random_uniform(13) + 1
            
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                
                // Store the number into the generatedNumbersArray
                generatedNumbersArray.append(Int(randomNumber))
                
                // Create first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                // Create second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                // Add the pair of card to the array
                generatedCardsArray.append(cardOne)
                generatedCardsArray.append(cardTwo)
            }
        }
        
        // Randomize the array
        
        for i in 0...generatedCardsArray.count - 1 {
            
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
            let tempStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = tempStorage
        }
        
        
        // Return the array
        return generatedCardsArray
        
    }
}
