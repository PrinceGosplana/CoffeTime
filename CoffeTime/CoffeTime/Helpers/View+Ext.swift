//
//  View+Ext.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 11.07.2024.
//

import SwiftUI

extension View {
    @ViewBuilder
    func customOnChange<T: Equatable>(value: T, result: @escaping (T) -> ()) -> some View {
        if #available(iOS 17, *) {
            self
                .onChange(of: value) { oldValue, newValue in
                    result(newValue)
                }
        } else {
            self
                .onChange(of: value, perform:  { value in
                    result(value)
                })
        }
    }

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

    @ViewBuilder
    func heroLayer<Content: View>(
        id: String,
        animate: Binding<Bool>,
        sourceCornerRadius: CGFloat = 0,
        destinnationCornerRadius: CGFloat = 0,
        @ViewBuilder content: @escaping () -> Content,
        completion: @escaping (Bool) -> ()
    ) -> some View {
        self
            .modifier(
                HeroLayerViewModifier(
                    id: id,
                    animate: animate,
                    sourceCornerRadius: sourceCornerRadius,
                    destinnationCornerRadius: destinnationCornerRadius,
                    layer: content,
                    completion: completion
                ))
    }
}
