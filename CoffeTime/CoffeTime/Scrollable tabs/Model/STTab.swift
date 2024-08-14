//
//  STTab.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 14.08.2024.
//

import SwiftUI

enum STTab: String, CaseIterable {
    case chats
    case calls
    case settings

    var title: String {
        switch self {
        case .chats: "Chats"
        case .calls: "Calls"
        case .settings: "Settings"
        }
    }
}
