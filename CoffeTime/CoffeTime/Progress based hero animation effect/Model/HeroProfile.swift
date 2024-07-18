//
//  HeroProfile.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.07.2024.
//

import SwiftUI

struct HeroProfile: Identifiable {
    var id = UUID()
    let userName: String
    let profilePicture: String
    let lastMsg: String
}

extension HeroProfile {
    static let mocks: [HeroProfile] = [
        .init(userName: "Henna Ezarik", profilePicture: "girl_1", lastMsg: "I miss you"),
        .init(userName: "Julie Stark", profilePicture: "girl_2", lastMsg: "I'm watching at you!"),
        .init(userName: "Janet Groove", profilePicture: "girl_3", lastMsg: "Shame on you!"),
        .init(userName: "Maria", profilePicture: "girl_4", lastMsg: "I'll miss you"),
        .init(userName: "Amber Clott", profilePicture: "girl_5", lastMsg: "Come to me"),
        .init(userName: "Caroline Ant", profilePicture: "girl_6", lastMsg: "No need apology"),
        .init(userName: "Isolda R.", profilePicture: "girl_7", lastMsg: "Youth and lust")
    ]
}
