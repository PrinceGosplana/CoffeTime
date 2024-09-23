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
    var isSeen: Bool = false
    let stories: [ISStory]
}

extension ISStoryBundle {
    static let yellowUser: ISStoryBundle = .init(profileName: "Yellow", profileImage: "user6", stories: ISStory.yellowStories)
    static let darkUser: ISStoryBundle = .init(profileName: "Dark", profileImage: "user4", stories: ISStory.darkishStories)

}
