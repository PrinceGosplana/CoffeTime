//
//  CASHMessage.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 19.09.2024.
//

import SwiftUI

struct CASHMessage: Identifiable {
    let id = UUID().uuidString
    let message: String
    let userName: String
    let tintColor: Color
}

extension CASHMessage {
    static let mock: [CASHMessage] = [
        .init(message: "Can we go to the park.", userName: "Maria", tintColor: .pink),
        .init(message: "Can we go down to the store with the dog. It is not too far away.", userName: "Jenna", tintColor: .orange),
        .init(message: "Can we go to the park.", userName: "Artier", tintColor: .green),
        .init(message: "Can we go downstairs?", userName: "Markus", tintColor: .yellow),
        .init(message: "Who can go to the park?.", userName: "Jeff", tintColor: .mint),
        .init(message: "Don't you know it?", userName: "Wanda", tintColor: .cyan),
        .init(message: "Salte mortale vuala", userName: "Fokus", tintColor: .pink),
        .init(message: "Abra kadabra avagadra", userName: "Garry", tintColor: .indigo),
    ]
}
