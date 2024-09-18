//
//  CASHCustomCorner.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 18.09.2024.
//

import SwiftUI

struct CASHCustomCorner: Shape {

    let corners: UIRectCorner
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
