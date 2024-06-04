//
//  DummyTab.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 04.06.2024.
//

import SwiftUI

enum DummyTab: String, CaseIterable {
    case home = "Home"
    case chats = "Chats"
    case calls = "Calls"
    case settings = "Settings"
    
    var color: Color {
        switch self {
        case .home: Color(.systemRed)
        case .chats: Color(.systemBlue)
        case .calls: Color(.systemIndigo)
        case .settings: Color(.systemPurple)
        }
    }
}
