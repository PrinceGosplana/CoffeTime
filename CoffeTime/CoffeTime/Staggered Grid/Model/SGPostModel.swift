//
//  SGPostModel.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 08.09.2024.
//

import SwiftUI

struct SGPostModel: Identifiable {
    let id = UUID().uuidString
    let imageURL: String
}

extension SGPostModel {
    static let mocks: [SGPostModel] = [
        .init(imageURL: "previewSample1"),
        .init(imageURL: "girl_1"),
        .init(imageURL: "listing-2"),
        .init(imageURL: "listing-4"),
        .init(imageURL: "girl_2"),
        .init(imageURL: "previewSample4"),
        .init(imageURL: "girl_3"),
        .init(imageURL: "girl_4"),
        .init(imageURL: "listing-3"),
        .init(imageURL: "previewSample2")
    ]
}
