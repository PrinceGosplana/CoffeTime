//
//  HeroLayerViewModifier.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 11.07.2024.
//

import SwiftUI

/// The reason for the usage of ViewModifier here is to access the HeroModel environment object for passing the necessary details for source and destination views
struct HeroLayerViewModifier<Layer: View>: ViewModifier {

    let id: String
    @Binding var animate: Bool
    var sourceCornerRadius: CGFloat = 0
    var destinnationCornerRadius: CGFloat = 0
    @ViewBuilder var layer: Layer
    var completion: (Bool) -> ()
    /// Hero model
    @EnvironmentObject private var heroModel: HeroModel
    func body(content: Content) -> some View {
        content
            .onAppear {
                /// Whenever a hero layer modifier is created, we will be creating a heroinfo for that id and saving all the given properties so that souce and destination views can access the heroInfo information with the same id
                if !heroModel.info.contains(where: { $0.infoID == id }) {
                    heroModel.info.append(.init(id: id))
                }
            }
        /// Let's now animate the view and pass it all the properties the LayerView needs
            .customOnChange(value: animate) { newValue in
                if let index = heroModel.info.firstIndex(where: { $0.infoID == id }) {
                    /// Setting up all the necessary properties for the animation
                    heroModel.info[index].isActive = true
                    heroModel.info[index].layerView = AnyView(layer)
                    heroModel.info[index].sCornerRadius = sourceCornerRadius
                    heroModel.info[index].dCornerRadius = destinnationCornerRadius
                    heroModel.info[index].completion = completion

                    if newValue {
                        /// the reason for the delay is for the destination view to get loaded into the screen for reading its anchor values
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            withAnimation(.snappy(duration: 0.35, extraBounce: 0)) {
                                heroModel.info[index].animateView = true
                            }
                        }
                    } else {
                        heroModel.info[index].hideView = false
                        withAnimation(.snappy(duration: 0.35, extraBounce: 0)) {
                            heroModel.info[index].animateView = false
                        }
                    }
                }

            }

    }
}
