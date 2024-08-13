//
//  SHSampleCardsView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.08.2024.
//

import SwiftUI

struct SHSampleCardsView: View {
    var body: some View {
        VStack(spacing: 10) {
            ForEach(1...25, id:\.self) { _ in
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.black.opacity(0.05))
                    .frame(height: 80)
            }
        }
    }
}
