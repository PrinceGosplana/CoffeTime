//
//  CustomScrollBehaviour.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.08.2024.
//

import SwiftUI

/// Custom scroll target behaviour
/// aka scrollVillEndDragging in UIKit
struct CustomScrollBehaviour: ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        if target.rect.minY < 75 {
            target.rect = .zero
        }
    }
}
