//
//  PassthroughWindow.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 12.07.2024.
//

import SwiftUI

class PassthroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event) else { return nil }
        return rootViewController?.view == view ? nil : view
    }
}
