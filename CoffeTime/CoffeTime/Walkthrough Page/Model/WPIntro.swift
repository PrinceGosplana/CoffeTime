//
//  WPIntro.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.09.2024.
//

import SwiftUI

struct WPIntro: Identifiable {
    let id = UUID().uuidString
    let image: String
    let title: String
    let description: String
    let color: Color
}

extension WPIntro {
    static let mocks: [WPIntro] = [
        .init(image: "fresh1", title: "Choose your favourite menu", description: "But they are not the inconvenience that our pleasure", color: .cyan),
        .init(image: "fresh2", title: "Find the best price", description: "There is no provision to smooth the consequences are", color: .yellow),
        .init(image: "fresh3", title: "Your food is ready to be delivered", description: "ter than the paoin of the soul to the task", color: .indigo)
    ]
}
