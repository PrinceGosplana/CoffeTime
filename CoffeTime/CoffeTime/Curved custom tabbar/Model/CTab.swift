//
//  CTab.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.07.2024.
//

import SwiftUI

enum CTab: String, CaseIterable, Identifiable {
    case home = "Home"
    case services = "Services"
    case partners = "Partners"
    case activity = "Activity"

    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .services:
            return "envelope.open.badge.clock"
        case .partners:
            return "hand.raised"
        case .activity:
            return "bell"
        }
    }

    var index: Int {
        CTab.allCases.firstIndex(of: self) ?? 0
    }

    var id: String { rawValue }
}
