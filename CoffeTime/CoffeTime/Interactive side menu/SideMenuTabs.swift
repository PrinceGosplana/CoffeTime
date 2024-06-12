//
//  SideMenuTabs.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 12.06.2024.
//

enum SideMenuTab: String, CaseIterable {
    case home = "house.fill"
    case bookmark = "book.fill"
    case favourites = "heart.fill"
    case profile = "person.crop.circle"
    case logout = "rectangle.portrait.and.arrow.forward.fill"

    var title: String {
        switch self {
        case .home: return "Home"
        case .bookmark: return "Bookmark"
        case .favourites: return "Favourites"
        case .profile: return "Profile"
        case .logout: return "Logout"
        }
    }
}
