//
//  FlipClockTextView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.06.2024.
//

import SwiftUI

struct FlipClockTextView: View {
    var body: some View {
        NavigationStack {
            VStack {
                FlipClockTextEffect(
                    value: 0,
                    size: CGSize(
                        width: 100,
                        height: 150
                    ),
                    fontSize: 70,
                    cornerRadius: 10,
                    foreground: .white,
                    background: .red
                )
            }
        }
    }
}

#Preview {
    FlipClockTextView()
}
