//
//  CPSAlbum.swift
//  CoffeTime
//
//  Created by OLEKSANDR ISAIEV on 08.10.2024.
//

import SwiftUI

struct CPSAlbum: Identifiable {
    var id = UUID().uuidString
    let albumName: String
    let albumImage: String
    let rating: Int
    var showDisk: Bool = false
    var diskOffset: CGFloat = 0
}

extension CPSAlbum {
    static let mocks: [CPSAlbum] = [
        .init(albumName: "Album 1", albumImage: "previewSample1", rating: 4),
        .init(albumName: "Album 2", albumImage: "previewSample2", rating: 3),
        .init(albumName: "Album 3", albumImage: "previewSample3", rating: 5),
        .init(albumName: "Album 1", albumImage: "previewSample4", rating: 4),
        .init(albumName: "Album 2", albumImage: "previewSample5", rating: 3),
        .init(albumName: "Album 3", albumImage: "previewSample6", rating: 5),
    ]
}
