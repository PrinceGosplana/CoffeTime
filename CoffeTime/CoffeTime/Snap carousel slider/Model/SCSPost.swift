//
//  SCSPost.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 24.09.2024.
//

import SwiftUI

struct SCSPost: Identifiable {
    var id = UUID().uuidString
    let postImage: String
}

extension SCSPost {
    static let mock: [SCSPost] = [
        .init(postImage: "fresh1"),
        .init(postImage: "fresh2"),
        .init(postImage: "fresh3"),
        .init(postImage: "fresh4"),
        .init(postImage: "fresh5"),
        .init(postImage: "fresh6")
    ]
}
