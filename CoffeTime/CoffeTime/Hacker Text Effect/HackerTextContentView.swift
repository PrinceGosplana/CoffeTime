//
//  HackerTextContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.06.2024.
//

import SwiftUI

struct HackerTextContentView: View {
    @State private var trigger: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HackerTextView(text: "Made with SwiftUI\nFor people", trigger: trigger)
                .font(.largeTitle.bold())
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HackerTextContentView()
}
