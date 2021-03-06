//
//  RA2ViewModel.swift
//  ProgrammingAssignment2
//
//  Created by Vladislav Gorovenko on 06.04.2022.
//

import Foundation

class RA2ViewModel: ObservableObject {
    
    init() {
        theme = RA2ViewModel.themes.randomElement()!
        theme.emojis.shuffle()
        model = RA2ViewModel.createGame(theme: theme)
    }
    
    private(set) var theme: Theme
    var result: Int {
        return model.result
    }
    static var cardsContent: Array<String>?
    @Published private(set) var model: RA2Model<String>
    
    static var themes: Array<Theme> = [
        
        Theme(name: "Cars",
              emojis: ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðŧ", "ð", "ð", "ð"],
              numberOfCards: 5,
              color: .red),
        
        Theme(name: "Emotions",
              emojis: ["ð","ð","ðĨđ","ð","ð","ðĨē","âšïļ","ð","ð","ð","ðĨ°","ð","ð","ðĪŠ","ðĪ","ð"],
              numberOfCards: 5,
              color: .green),
        
        Theme(name: "Animals",
              emojis: ["ðđ","ð°","ðĶ","ðŧ", "ðž", "ðĻ", "ðŊ", "ðĶ", "ðŪ", "ð·", "ðļ", "ðĩ", "ðķ", "ðą", "ð­"],
              numberOfCards: 100,
              color: .blue),
        
        Theme(name: "Fruits",
              emojis: ["ð","ð","ð","ð","ð","ð","ð", "ð", "ð", "ðŦ", "ð", "ð", "ð", "ðĨ­", "ð", "ðĨĨ"],
              numberOfCards: 5,
              color: .orange),
        
        Theme(name: "Activity",
              emojis: ["â―ïļ", "ð", "ð", "âūïļ", "ð", "ð", "ðĨ", "ðą", "ðŠ", "ð", "ðļ", "ð", "ð", "ðĨ", "ð", "ðŠ", "ðĨ"],
              numberOfCards: 5,
              color: .gray),
        
        Theme(name: "Flags",
              emojis: ["ðģïļ","ðī", "ðīââ ïļ", "ð", "ðĐ", "ðģïļâð", "ðģïļââ§ïļ", "ðšðģ", "ðĶðŦ", "ðĶð―", "ðĶðą", "ðĐðŋ", "ðĶðļ", "ðĶðĐ", "ðĶðī", "ðĶðŪ", "ðĶðķ"],
              numberOfCards: 5,
              color: .pink),
    ]
    

    
    static func createGame(theme: Theme) -> RA2Model<String> {
        RA2Model<String>.init(theme: theme) { (index: Int) -> String in
            return theme.emojis[index]
        }
    }
    
    var cards: Array<RA2Model<String>.Card> {
        return model.cards
    }
    
    func chooseCards(card: RA2Model<String>.Card) {
        model.chooseCard(chosenCard: card)
    }
    
    func newGame() {
        theme = RA2ViewModel.themes.randomElement()!
        theme.emojis.shuffle()
        model = RA2ViewModel.createGame(theme: theme)
    }
}

