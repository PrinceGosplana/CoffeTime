//
//  WUISRainFall.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SpriteKit
import SwiftUI

class WUISRainFall: SKScene {
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill

        /// background color
        backgroundColor = .clear

        /// creating node and adding to scene
        let node = SKEmitterNode(fileNamed: "WUISRainFall.sks")!
        addChild(node)
    }
}
