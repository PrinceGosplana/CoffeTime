//
//  CTBAOffsetModifier.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SwiftUI 
struct CTBAOffsetModifier: ViewModifier {
    
    @EnvironmentObject var model: CTBABottomBarViewModel

    func body(content: Content) -> some View {
        content
            .overlay (
                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .named("TabScroll")).minY

                    let durationOffset: CGFloat = 35

                    DispatchQueue.main.async {

                        if minY < model.offset {
                            if model.offset < 0 && -minY > (model.lastStoredOffset + durationOffset) {
                                withAnimation(.easeInOut.speed(1.5)) {
                                    model.tabState = .expanded
                                }
                                /// storing last offset
                                model.lastStoredOffset = -model.offset
                            }
                        }

                        if minY > model.offset && -minY < (model.lastStoredOffset - durationOffset){
                            withAnimation(.easeInOut.speed(1.5)) {
                                model.tabState = .floating
                            }
                            /// storing last offset
                            model.lastStoredOffset = -model.offset
                        }

                        model.offset = minY
                    }

                    return Color.clear

                }, alignment: .top
            )
    }
}
