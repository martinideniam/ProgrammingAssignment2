//
//  ContentView.swift
//  ProgrammingAssignment2
//
//  Created by Vladislav Gorovenko on 06.04.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: RA2ViewModel
    var body: some View {
        VStack {
            Header(themeChosen: viewModel.theme.name, result: viewModel.result)
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))], alignment: .center) {
                    ForEach(viewModel.cards) { card in
                        if !card.isMatched {
                            CardView(card: card, colorOfTheme: viewModel.theme.color)
                                .aspectRatio(2/2.5, contentMode: .fit)
                                .padding(2)
                                .onTapGesture {
                                    viewModel.chooseCards(card: card)
                                }
                        } else {
                            CardView(card: card, colorOfTheme: viewModel.theme.color)
                                .aspectRatio(2/2.5, contentMode: .fit)
                                .padding(2)
                                .foregroundColor(.green)
                                .opacity(0.2)
                                .onTapGesture {
                                    print(card)
                                }
                        }
                    }
                }
                .padding(10)
            }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            Spacer()
            NewGameButton(newGame: viewModel.newGame, color: viewModel.theme.color)
        }
    }
}

struct CardView: View {
    var card: RA2Model<String>.Card
    var colorOfTheme: Theme.Colors
    var body: some View {
        ZStack {
            if card.isFacedUp {
                RoundedRectangle(cornerRadius: 25)
                Text(card.content).font(.system(size: 40))
                    .padding(20)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(CardView.interpretColorEnum(colorOfTheme))
                RoundedRectangle(cornerRadius: 25)
                    .stroke()
                    .foregroundColor(.black)
            }
        }
    }
    static func interpretColorEnum(_ color: Theme.Colors) -> Color {
        switch color {
            case .red:
                return Color.red
            case .blue:
                return Color.blue
            case .green:
                return Color.green
            case .gray:
                return Color.gray
            case .orange:
                return Color.orange
            case .pink:
                return Color.pink
        }
    }
}

struct NewGameButton: View {
    var newGame: () -> Void
    var color: Theme.Colors
    var body: some View {
        Button {
            newGame()
        } label: {
            Text("New Game")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(CardView.interpretColorEnum(color))
        }

    }
}

struct Header: View {
    var themeChosen: String
    var result: Int
    var body: some View {
        VStack {
            Text("\(themeChosen)")
                .font(.system(size: 40, weight: .bold, design: .rounded))
            Text("Result: \(result) points")
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RA2ViewModel()
        ContentView(viewModel: viewModel)
            .previewInterfaceOrientation(.portrait)
    }
}
