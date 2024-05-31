//
//  RangeSliderView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.05.2024.
//

import SwiftUI

struct RangeSliderView: View {

    @Binding var selection: ClosedRange<CGFloat>
    var range: ClosedRange<CGFloat>
    var minimumDistance: CGFloat = 0
    var tint: Color = .primary
    
    /// View properties
    @State private var slider1: GestureProperties = .init()
    @State private var slider2: GestureProperties = .init()
    @State private var indicatorWidth: CGFloat = 0
    @State private var isInitial: Bool = false

    var body: some View {
        GeometryReader { reader in
            let maxSliderWidth = reader.size.width - 30
            let minimumDistance = minimumDistance == 0 ? 0 : (minimumDistance / (range.upperBound - range.lowerBound)) * maxSliderWidth

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(tint.tertiary)
                    .frame(height: 5)

                /// Sliders
                HStack(spacing: 0) {
                    Circle()
                        .fill(tint)
                        .frame(width: 15, height: 15)
                        .contentShape(.rect)
                        .overlay(alignment: .leading) {
                            Rectangle()
                                .fill(tint)
                                .frame(width: indicatorWidth, height: 5)
                                .offset(x: 15)
                                .allowsHitTesting(false)
                        }
                        .offset(x: slider1.offset)
                        .gesture (
                            DragGesture(minimumDistance: 0)
                                .onChanged{ value in
                                    /// Calculate offset
                                    var translation = value.translation.width + slider1.lastStoredOffset
                                    translation = min(max(translation, 0), slider2.offset - minimumDistance)
                                    slider1.offset = translation

                                    calculateNewRange(reader.size)
                                }.onEnded{ _ in
                                    /// Storing previous offset
                                    slider1.lastStoredOffset = slider1.offset
                                }
                        )

                    Circle()
                        .fill(tint)
                        .frame(width: 15, height: 15)
                        .contentShape(.rect)
                        .offset(x: slider2.offset)
                        .gesture (
                            DragGesture(minimumDistance: 0)
                                .onChanged{ value in
                                    /// Calculate offset
                                    var translation = value.translation.width + slider2.lastStoredOffset
                                    translation = min(max(translation, slider1.offset), maxSliderWidth + minimumDistance)
                                    slider2.offset = translation

                                    calculateNewRange(reader.size)
                                }.onEnded{ _ in
                                    /// Storing previous offset
                                    slider2.lastStoredOffset = slider2.offset
                                }
                        )
                }
            }
            .frame(maxHeight: .infinity)
            .task {
                guard !isInitial else { return }
                isInitial = true

                try? await Task.sleep(for: .seconds(0))
                let maxWidth = reader.size.width - 30

                /// converting selection range into offset
                let start = selection.lowerBound.interpolate(inputRange: [range.lowerBound, range.upperBound], outputRange: [0, maxWidth])
                let end = selection.upperBound.interpolate(inputRange: [range.lowerBound, range.upperBound], outputRange: [0, maxWidth])

                slider1.offset = start
                slider1.lastStoredOffset = start

                slider2.offset = end
                slider2.lastStoredOffset = end

                calculateNewRange(reader.size)
            }
        }
        .frame(height: 20)
    }

    private func calculateNewRange(_ size: CGSize) {
        indicatorWidth = slider2.offset - slider1.offset

        let maxWidth = size.width - 30
        /// calculating new range values
        let startProgress = slider1.offset / maxWidth
        let endProgress = slider2.offset / maxWidth

        /// Interpolating between upper and lower bounds
        let newRangeStart = range.lowerBound.interpolated(towards: range.upperBound, amount: startProgress)
        let newRangeEnd = range.lowerBound.interpolated(towards: range.upperBound, amount: endProgress)

        /// Updating selection
        selection = newRangeStart...newRangeEnd
    }

    private struct GestureProperties {
        var offset: CGFloat = 0
        var lastStoredOffset: CGFloat = 0
    }
}

#Preview {
    RangeSliderView(selection: .constant(30...50), range: 30...100)
}
