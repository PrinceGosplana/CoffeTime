//
//  HeroItem.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.07.2024.
//

import SwiftUI

/// Demo item model
struct HeroItem: Identifiable {
    var id = UUID()
    let title: String
    let color: Color
    let symbol: String
}

extension HeroItem {
    static var mocks: [HeroItem] = [
        .init(title: "Book Icon", color: .red, symbol: "book.fill"),
        .init(title: "Stack Icon", color: .mint, symbol: "square.stack.3d.up"),
        .init(title: "Rectangle Icon", color: .indigo, symbol: "rectangle.portrait")
    ]
}
