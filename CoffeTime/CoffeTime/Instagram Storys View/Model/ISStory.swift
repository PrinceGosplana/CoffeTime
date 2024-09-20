//
//  ISStory.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.09.2024.
//

import SwiftUI

struct ISStory: Identifiable {
    let id = UUID().uuidString
    let imageURL: String
}

extension ISStory {
    static let yellowStories: [ISStory] = [
        .init(imageURL: "fresh2"),
        .init(imageURL: "fresh4"),
        .init(imageURL: "fresh6")
    ]

    static let darkishStories: [ISStory] = [
        .init(imageURL: "fresh3"),
        .init(imageURL: "fresh5")
    ]
}
