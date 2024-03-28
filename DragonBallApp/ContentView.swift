//
//  ContentView.swift
//  DragonBallApp
//
//  Created by Marco Guevara on 28/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = DBViewModel()
    
    private let numberOfColumns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: numberOfColumns, spacing: 10) {
                    ForEach(viewModel.characters, id: \.id) { character in
                        VStack {
                            Text(character.name)
                            Text(character.image)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
