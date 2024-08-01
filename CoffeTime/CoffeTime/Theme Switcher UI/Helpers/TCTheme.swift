//
//  TCTheme.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.07.2024.
//

import SwiftUI

enum TCTheme: String, CaseIterable {
    case systemDefault = "Default"
    case light = "Light"
    case dark = "Dark"

    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .systemDefault:
            return scheme == .dark ? .moon! : .sun!
        case .light:
            return .sun!
        case .dark:
            return .moon!
        }
    }

    /// nil simply represents the system default behaviour
    var colorScheme: ColorScheme? {
        switch self {
        case .systemDefault:
                nil
        case .light:
                .light
        case .dark:
                .dark
        }
    }
}
