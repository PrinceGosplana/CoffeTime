//
//  ACMovie.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.09.2024.
//

import SwiftUI

struct ACMovie: Identifiable {
    let id = UUID().uuidString
    let movieName: String
    let artwork: String
}

extension ACMovie {
    static let mock: [ACMovie] = [
        .init(movieName: "Black Window", artwork: "fresh2"),
        .init(movieName: "Loki", artwork: "fresh3"),
        .init(movieName: "Wanda Vision", artwork: "fresh4"),
        .init(movieName: "The Falcon", artwork: "fresh5"),
        .init(movieName: "Mulan", artwork: "fresh6"),
        .init(movieName: "Endgame", artwork: "fresh7"),
        .init(movieName: "Age of Ultron", artwork: "fresh8")
    ]
}
