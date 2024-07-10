//
//  SourceView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 09.07.2024.
//

import SwiftUI

struct SourceView<Content: View>: View {
    let id: String
    @EnvironmentObject private var hereModel: HeroModel
    @ViewBuilder var content: Content
    var body: some View {
        content
            .anchorPreference(key: AnchorKey.self, value: .bounds, transform: { anchor in
                /// Whenever the hero effect for the given ID is active, we will be returning its anchor value for handling the animation
                if let index, hereModel.info[index].isActive {
                    return [id: anchor]
                }
                return [:]
            })
    }

    private var index: Int? {
        if let index = hereModel.info.firstIndex(where: { $0.infoID == id }) {
            return index
        }
        return nil
    }
}
