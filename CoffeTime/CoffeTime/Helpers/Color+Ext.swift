//
//  Color+Ext.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 01.08.2024.
//

import SwiftUI

extension Color {
    /// Return a random color
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

