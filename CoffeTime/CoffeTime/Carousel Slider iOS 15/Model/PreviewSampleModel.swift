//
//  PreviewSampleModel.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.09.2024.
//

import Foundation

struct PreviewSampleModel: Hashable, Identifiable {
    var id = UUID()
    let name: String
}

extension PreviewSampleModel {
    static let mocks: [PreviewSampleModel] = [
        .init(name: "previewSample1"),
        .init(name: "previewSample2"),
        .init(name: "previewSample3"),
        .init(name: "previewSample4"),
        .init(name: "previewSample5"),
        .init(name: "previewSample6"),
        .init(name: "previewSample7"),
        .init(name: "previewSample8")
    ]
}
