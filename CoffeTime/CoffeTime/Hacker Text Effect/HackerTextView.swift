//
//  HackerTextView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.06.2024.
//

import SwiftUI

struct HackerTextView: View {
    /// Config
    var text: String
    var trigger: Bool
    var transition: ContentTransition = .interpolate
    var duration: CGFloat = 1.0
    var speed: CGFloat = 0.1

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HackerTextContentView()
}
