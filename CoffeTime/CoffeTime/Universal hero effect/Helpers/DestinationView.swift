//
//  DestinationView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 09.07.2024.
//

import SwiftUI

struct DestinationView<Content: View>: View {

    var id: String
    @ViewBuilder var content: Content
    @EnvironmentObject private var heroModel: HeroModel

    var body: some View {
        content
            .opacity(opacity)
            .anchorPreference(key: AnchorKey.self, value: .bounds, transform: { anchor in
                /// Whenever the hero effect for the given ID is active, we will be returning its anchor value for handling the animation
                if let index, heroModel.info[index].isActive {
                    return ["\(id)DESTINATION": anchor]
                }
                return [:]
            })
            .onPreferenceChange(AnchorKey.self, perform: { value in
                if let index, heroModel.info[index].isActive {
                    heroModel.info[index].destinationAnchor = value["\(id)DESTINATION"]
                }
            })
    }

    var index: Int? {
        if let index = heroModel.info.firstIndex(where: { $0.infoID == id }) {
            return index
        }
        return nil
    }

    var opacity: CGFloat {
        if let index {
            return heroModel.info[index].isActive ? (heroModel.info[index].hideView ? 1 : 0) : 1
        }
        return 1
    }
}
