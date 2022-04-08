//
//  RA2Model.swift
//  ProgrammingAssignment2
//
//  Created by Vladislav Gorovenko on 06.04.2022.
//

import Foundation
import SwiftUI

struct RA2Model<CardContent> where CardContent:Equatable {
    
    var cards: Array<Card>
    var theIndexOfTheOnlyFacedUpCard: Int?
    var result: Int
    
    init(theme: Theme, generateCard: (Int) -> CardContent) {
        cards = [Card]()
        result = 0
        for index in 0..<theme.numberOfCards {
            let content = generateCard(index)
            cards.append(Card(content: content, id: index*2))
            cards.append(Card(content: content, id: index*2+1))
        }
        cards = cards.shuffled()
    }
    
    mutating func chooseCard(chosenCard: Card) {
        if let index = cards.firstIndex(where: {$0.id == chosenCard.id}) { //find index of the card in cards
            if let potentialMatchIndex = theIndexOfTheOnlyFacedUpCard { //if there is any card already up
                if cards[potentialMatchIndex].content == cards[index].content && index != potentialMatchIndex { //cards content equal
                    cards[index].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    result += 2
                }
                result -= 1
                theIndexOfTheOnlyFacedUpCard = nil
            } else {
                for i in cards.indices {
                    if !cards[i].isMatched {
                        cards[i].isFacedUp = false
                    }
                }
                theIndexOfTheOnlyFacedUpCard = index
            }
            cards[index].isFacedUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        var isFacedUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
