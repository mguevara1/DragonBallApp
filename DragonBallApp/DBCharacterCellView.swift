//
//  DBCharacterCellView.swift
//  DragonBallApp
//
//  Created by Marco Guevara on 28/03/24.
//

import SwiftUI

struct DBCharacterCellView: View {
    let dbCharacter: DBZCharacter
    @StateObject var viewModel: DBViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.orange)
                .cornerRadius(25.0)
            
            VStack {
                ImageCharacterView(url: dbCharacter.image, width: 90, height: 170)
                
                Text(dbCharacter.name)
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    DBCharacterCellView(dbCharacter: MockData.dbCharacters[1], viewModel: DBViewModel())
}
