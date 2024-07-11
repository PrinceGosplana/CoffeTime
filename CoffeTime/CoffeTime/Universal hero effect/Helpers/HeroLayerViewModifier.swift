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

    func body(content: Content) -> some View {
        content
    }
}
