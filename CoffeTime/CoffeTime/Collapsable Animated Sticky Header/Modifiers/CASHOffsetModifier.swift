//
//  CASHOffsetModifier.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 18.09.2024.
//

import SwiftUI

struct CASHOffsetModifier: ViewModifier {

    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .named("SCROLL")).minY

                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    return .clear
                },
                alignment: .top
            )
    }
}
