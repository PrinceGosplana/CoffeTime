//
//  SBTab.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 16.08.2024.
//

import SwiftUI

enum SBTab: String, CaseIterable {
    case all
    case personal
    case office
    case community

    var title: String {
        switch self {
        case .all: "All"
        case .personal: "Personal"
        case .office: "Updates"
        case .community: "Community"
        }
    }
}
