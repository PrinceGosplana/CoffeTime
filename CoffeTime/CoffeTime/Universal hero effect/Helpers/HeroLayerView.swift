//
//  HeroLayerView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 12.07.2024.
//

import SwiftUI

struct HeroLayerView: View {

    @EnvironmentObject private var hereModel: HeroModel

    var body: some View {
        GeometryReader { proxy in
            ForEach($hereModel.info) { $info in
                ZStack {
                    if let sourceAnchor = info.sourceAnchor,
                       let destinationAnchor = info.destinationAnchor,
                       let layerView = info.layerView,
                       !info.hideView {
                        /// Retrieving bounds data from the anchor values
                        let sRect = proxy[sourceAnchor]
                        let dRect = proxy[destinationAnchor]
                        let animateView = info.animateView

                        let size = CGSize(
                            width: animateView ? dRect.size.width : sRect.size.width,
                            height: animateView ? dRect.size.height : sRect.size.height
                        )

                        let offset = CGSize(
                            width: animateView ? dRect.minX : sRect.minX,
                            height: animateView ? dRect.minY : sRect.minY
                        )

                        layerView
                            .frame(width: size.width, height: size.height)
                            .clipShape(.rect(cornerRadius: animateView ? info.dCornerRadius : info.sCornerRadius))
                            .offset(offset)
                            .transition(.identity)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    }
                }
                .customOnChange(value: info.animateView) { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                        if !newValue {
                            /// Reseting all data once the view goes back to it's source state
                            info.isActive = false
                            info.layerView = nil
                            info.sourceAnchor = nil
                            info.destinationAnchor = nil
                            info.sCornerRadius = 0
                            info.dCornerRadius = 0

                            info.completion(false)
                        } else {
                            info.hideView = true
                            info.completion(true)
                        }
                    }
                }
            }
        }
    }
}
