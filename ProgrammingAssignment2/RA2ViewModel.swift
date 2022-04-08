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
              emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"],
              numberOfCards: 5,
              color: .red),
        
        Theme(name: "Emotions",
              emojis: ["😀","😆","🥹","😅","😂","🥲","☺️","😇","😌","😍","🥰","😛","😜","🤪","🤓","😎"],
              numberOfCards: 5,
              color: .green),
        
        Theme(name: "Animals",
              emojis: ["🐹","🐰","🦊","🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐶", "🐱", "🐭"],
              numberOfCards: 100,
              color: .blue),
        
        Theme(name: "Fruits",
              emojis: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥"],
              numberOfCards: 5,
              color: .orange),
        
        Theme(name: "Activity",
              emojis: ["⚽️", "🏀", "🏈", "⚾️", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒", "🏑", "🥍", "🏏", "🪃", "🥅"],
              numberOfCards: 5,
              color: .gray),
        
        Theme(name: "Flags",
              emojis: ["🏳️","🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈", "🏳️‍⚧️", "🇺🇳", "🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶"],
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

