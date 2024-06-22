//
//  SSItem.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 22.06.2024.
//

import SwiftUI

struct SSItem: Identifiable {
    var id: UUID = .init()
    var logo: String
    let title: String
    let description = "Lorem Ipsum is simply dummu text of thee printing and typesetting industry"
}

extension SSItem {
    static let mockItems: [SSItem] = [
        .init(logo: "user1", title: "Amazon"),
        .init(logo: "user2", title: "Youtube"),
        .init(logo: "user3", title: "Dribble"),
        .init(logo: "user4", title: "Apple"),
        .init(logo: "user5", title: "Patreon"),
        .init(logo: "user6", title: "Instagram"),
        .init(logo: "user7", title: "Netflix"),
        .init(logo: "profile", title: "Photoshop")
    ]
}
