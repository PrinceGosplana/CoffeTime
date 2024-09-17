//
//  FSPVFullSwipePopHelper.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 17.09.2024.
//

import SwiftUI

struct FSPVFullSwipePopHelper<MainContent: View, Content: View>: View {
    let mainContent: MainContent
    let content: Content
    @Binding var show: Bool

    init(mainContent: MainContent, content: Content, show: Binding<Bool>) {
        self.mainContent = mainContent
        self.content = content
        self._show = show
    }

    var body: some View {
        GeometryReader { proxy in
            mainContent
                .overlay(
                    ZStack {
                        if show {
                            content
                        }
                    }
                )
        }
    }
}
