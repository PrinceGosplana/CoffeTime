//
//  HeroInfo.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 10.07.2024.
//

import SwiftUI

/// This will contain all the necessary information about each hero effect
struct HeroInfo: Identifiable {
    private(set) var id: UUID = .init()
    private(set) var infoID: String
    var isActive: Bool = false
    var layerView: AnyView?
    var animateView: Bool = false
    var hideView: Bool = false
    var sourceAnchor: Anchor<CGRect>?
    var destinationAnchor: Anchor<CGRect>?
    var sCornerRadius: CGFloat = 0
    var dCornerRadius: CGFloat = 0
    var completion: (Bool) -> () = { _ in }
    
    init(id: String) {
        self.infoID = id
    }
}
