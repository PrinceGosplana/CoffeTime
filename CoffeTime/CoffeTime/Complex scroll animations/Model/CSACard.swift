//
//  CSACard.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 19.08.2024.
//

import SwiftUI

/// Card model and sample cards
struct CSACard: Identifiable {
    let id = UUID()
    let bgColor: Color
    let balance: String
}

extension CSACard {
    static let cards: [CSACard] = [
        .init(bgColor: .red, balance: "$124,000"),
        .init(bgColor: .indigo, balance: "$12,000"),
        .init(bgColor: .orange, balance: "$24,000"),
        .init(bgColor: .purple, balance: "$4,000")
    ]
}
