//
//  CarousalItem.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 14.06.2024.
//

import Foundation

struct CarousalItem: Identifiable, Equatable {
    private(set) var id: UUID = .init()
    let title: String
    let year: String
    let runtime: String
    let certification: String
    let posterImage: String
    let stillImage: String
}

extension CarousalItem {
    static let items: [CarousalItem] = [
        .init(title: "House 1", year: "2022", runtime: "3h 1m", certification: "UA", posterImage: "listing-1", stillImage: "listing-2"),
        .init(title: "House 2", year: "2021", runtime: "2h 1m", certification: "A", posterImage: "listing-3", stillImage: "listing-4"),
        .init(title: "House 3", year: "2019", runtime: "2h 15m", certification: "UA", posterImage: "listing-5", stillImage: "listing-6"),
        .init(title: "House 4", year: "2023", runtime: "4h 1m", certification: "USA", posterImage: "listing-7", stillImage: "listing-1"),
        .init(title: "House 5", year: "2024", runtime: "3h 10m", certification: "A", posterImage: "listing-2", stillImage: "listing-3"),
        .init(title: "House 6", year: "2020", runtime: "2h 34m", certification: "UA", posterImage: "listing-4", stillImage: "listing-5")
    ]
}
