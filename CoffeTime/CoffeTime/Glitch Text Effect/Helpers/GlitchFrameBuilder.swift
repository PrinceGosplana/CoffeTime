//
//  GlitchFrameBuilder.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.06.2024.
//

import SwiftUI

@resultBuilder
struct GlitchFrameBuilder {
    static func buildBlock(_ components: LinearKeyframe<GlitchFrame>...) -> [LinearKeyframe<GlitchFrame>] {
        components
    }
}
