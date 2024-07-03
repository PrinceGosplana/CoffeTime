//
//  Message.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.06.2024.
//

import SwiftUI

struct Message: Identifiable {
    let id: UUID = .init()
    let image: String
    let name: String
    let message: String
    let online: Bool
    let read: Bool
}

extension Message {
    static let mock: [Message] = [
        .init(image: "BoJack_0", name: "BoJack", message: "Hi, What's up?", online: true, read: false),
        .init(image: "BoJack_2", name: "BoCrack", message: "How are you doing?", online: false, read: false),
        .init(image: "BoJack_3", name: "BoDuck", message: "Do you want to play?", online: true, read: true),
        .init(image: "BoJack_1", name: "JakPag", message: "Duh", online: false, read: false),
        .init(image: "BoJack_4", name: "Muleno", message: "Amazing!", online: true, read: true),
        .init(image: "BoJack_5", name: "Todd", message: "How come?", online: false, read: false),
        .init(image: "BoJack_6", name: "BoCorp", message: "No way", online: false, read: false),
        .init(image: "BoJack_7", name: "CrackNut", message: "Hi, What's up?", online: true, read: true),
        .init(image: "BoJack_8", name: "Dazzling", message: "Is that really you?", online: true, read: true),
        .init(image: "BoJackChild", name: "BoFly", message: "Hooray! A task!", online: true, read: true)
    ]
}
