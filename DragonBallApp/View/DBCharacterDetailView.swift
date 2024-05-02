//
//  DBCharacterDetailView.swift
//  DragonBallApp
//
//  Created by Marco Guevara on 28/03/24.
//

import SwiftUI

struct DBCharacterDetailView: View {
    
    @State private var isAnimating = false
    @StateObject var viewModel: DBViewModel
    let character: DBZCharacter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                ZStack {
                    VStack {
                        ImageCharacterView(url: character.image, width: 140, height: 230)
                            .shadow(radius: 12)
                            .scaleEffect(isAnimating ? 1.2 : 0.7)
                            .padding(.top, 40)
                        
                        Text(character.name)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }
                }
                Text(character.description)
                    .font(.footnote)
                
                HStack {
                    Text("Ki: \(character.ki)")
                    
                    Text("Max Ki: \(character.maxKi)")
                        .foregroundColor(.gray)
                }
                .font(.caption)
                .padding(.top, 24)
                
                HStack {
                    Text(character.race)
                        .foregroundColor(.red)
                    Text("-")
                    Text(character.affiliation)
                        .font(.subheadline)
                }
                .font(.caption)
                .padding(.top, 24)
            }
            .padding()
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation {
                        isAnimating = true
                    }
                }
            }
        }
    }
}

#Preview {
    DBCharacterDetailView(viewModel: DBViewModel(), character: MockData.dbCharacters[1])
}
