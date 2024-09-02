//
//  WUISRainFallLanding.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SpriteKit
import SwiftUI

class WUISRainFallLanding: SKScene {
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill

        /// anchor point
        let height = UIScreen.main.bounds.height
        /// getting percentage by emanating position range
        anchorPoint = CGPoint(x: 0.5, y: (height - 5) / height)

        /// background color
        backgroundColor = .clear

        /// creating node and adding to scene
        let node = SKEmitterNode(fileNamed: "WUISRainFallLanding.sks")!
        addChild(node)

        /// Removed for card padding
        node.particlePositionRange.dx = UIScreen.main.bounds.width - 40
    }
}
