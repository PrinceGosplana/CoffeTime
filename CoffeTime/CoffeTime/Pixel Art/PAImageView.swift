//
//  PAImageView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 14.06.2024.
//

import SwiftUI

struct PAImageView: View {
    
    let image: UIImage

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 400)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
