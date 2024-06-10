//
//  DummyColors.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 09.06.2024.
//

import SwiftUI

enum DummyColors: String, CaseIterable {
    case red = "Red"
    case blue = "Blue"
    case green = "Green"
    case cyan = "Cyan"
    case purple = "Purple"
    case indigo = "Indigo"
    case brown = "Brown"
    case black = "Black"
    case none = "None"

    var color: Color {
        switch self {
        case .red: return Color(.systemRed)
        case .blue: return Color(.systemBlue)
        case .green: return Color(.systemGreen)
        case .cyan: return Color(.systemCyan)
        case .purple: return Color(.systemPurple)
        case .indigo: return Color(.systemIndigo)
        case .brown: return Color(.systemBrown)
        case .black: return Color(.black)
        case .none: return Color(.clear)
        }
    }
}
