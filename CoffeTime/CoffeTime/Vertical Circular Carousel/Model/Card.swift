//
//  Card.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 06.06.2024.
//

import SwiftUI

struct Card: Identifiable {
    var id: UUID = .init()
    var number: String
    var name: String = "Juventus"
    var date: String = "12/27"
    var color: Color
}

extension Card {
    static let mockCards: [Card] = [
        .init(number: "1234", color: .purple),
        .init(number: "5678", color: .red),
        .init(number: "9012", color: .mint),
        .init(number: "3456", color: .orange),
        .init(number: "7890", color: .indigo),
        .init(number: "0987", color: .brown),
        .init(number: "6543", color: .cyan)
    ]
}
