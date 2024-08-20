//
//  CSCard.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.08.2024.
//

import SwiftUI

struct CSCard: Identifiable, Hashable, Equatable {
    let id = UUID()
    let image: String
    var previousOffset: CGFloat = 0
}

extension CSCard {
    static let mockCards: [CSCard] = [
        .init(image: "girl_1"),
        .init(image: "girl_2"),
        .init(image: "girl_3"),
        .init(image: "girl_4"),
        .init(image: "girl_5"),
        .init(image: "girl_6"),
        .init(image: "girl_7")
    ]
}
