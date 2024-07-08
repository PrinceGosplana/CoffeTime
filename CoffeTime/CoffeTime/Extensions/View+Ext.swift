//
//  View+Ext.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 08.07.2024.
//

import SwiftUI

extension View {

    @ViewBuilder
    func offset(coordinateSpace: CoordinateSpace, completion: @escaping (CGFloat) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: coordinateSpace).minY

                    Color.clear
                        .preference(key: OffsetKeyCGFloat.self, value: minY)
                        .onPreferenceChange(OffsetKeyCGFloat.self, perform: { value in
                            completion(value)
                        })
                }
            }
    }
}
