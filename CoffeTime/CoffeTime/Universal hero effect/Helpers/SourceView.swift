//
//  SourceView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 09.07.2024.
//

import SwiftUI

struct SourceView<Content: View>: View {
    @EnvironmentObject private var hereModel: HeroModel
    @ViewBuilder var content: Content
    var body: some View {
        content
    }
}
