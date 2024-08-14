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

    @ViewBuilder
    func reflection(_ added: Bool) -> some View {
        self
            .overlay {
                if added {
                    GeometryReader {
                        let size = $0.size
                        
                        self
                        /// Flipping upside down
                            .scaleEffect(y: -1)
                            .mask {
                                Rectangle()
                                    .fill(
                                        .linearGradient(colors: [
                                            .white,
                                            .white.opacity(0.7),
                                            .white.opacity(0.5),
                                            .white.opacity(0.3),
                                            .white.opacity(0.1),
                                            .white.opacity(0)
                                        ] + Array(repeating: Color.clear, count: 5), startPoint: .top, endPoint: .bottom)
                                    )
                            }
                        /// Moving to bottom
                            .offset(y: size.height + 5)
                            .opacity(0.5)
                    }
                }
            }
    }

    @ViewBuilder
    func offsetX(completion: @escaping (CGFloat) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX

                    Color.clear
                        .preference(key: OffsetKeyCGFloat.self, value: minX)
                        .onPreferenceChange(OffsetKeyCGFloat.self, perform: completion)
                }
            }
    }

    func tabMask(_ tabProgress: CGFloat, tabsCount: Int) -> some View {
        ZStack {
            self
                .foregroundStyle(.black)

            self
                .symbolVariant(.fill)
                .mask {
                    GeometryReader {
                        let size = $0.size
                        let capsuleWidth = size.width / CGFloat(tabsCount)

                        Capsule()
                            .frame(width: capsuleWidth)
                            .offset(x: tabProgress * (size.width - capsuleWidth))
                    }
                }
        }
    }
}
