//
//  ProgrammingAssignment2App.swift
//  ProgrammingAssignment2
//
//  Created by Vladislav Gorovenko on 06.04.2022.
//

import SwiftUI

@main
struct ProgrammingAssignment2App: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = RA2ViewModel()
            ContentView(viewModel: viewModel)
        }
    }
}
