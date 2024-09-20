//
//  ISStoryBundle.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.09.2024.
//

import SwiftUI

struct ISStoryBundle: Identifiable {
    let id = UUID().uuidString
    let profileName: String
    let profileImage: String
    let isSeen: Bool = false
    let stories: [ISStory]
}
