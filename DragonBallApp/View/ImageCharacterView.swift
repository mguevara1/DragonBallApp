//
//  ImageCharacterView.swift
//  DragonBallApp
//
//  Created by Marco Guevara on 28/03/24.
//

import SwiftUI
import Kingfisher

struct ImageCharacterView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        KFImage(URL(string: url))
            .resizable()
            .frame(width: width, height: height)
    }
}

#Preview {
    ImageCharacterView(url: MockData.dbCharacters[1].image, width: 100, height: 150)
}
