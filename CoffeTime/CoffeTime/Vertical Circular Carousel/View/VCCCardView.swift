//
//  VCCCardView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 06.06.2024.
//

import SwiftUI

struct VCCCardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(card.color.gradient)

            /// Card details
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: "creditcard.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .foregroundStyle(.white)

                Spacer(minLength: 0)

                HStack(spacing: 0) {
                    ForEach(0..<3, id: \.self) { _ in
                        Text("****")
                        Spacer(minLength: 0)
                    }

                    Text(card.number)
                        .offset(y: -2)
                }
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.bottom, 10)

                HStack {
                    Text(card.name)

                    Spacer(minLength: 0)

                    Text(card.date)
                }
                .font(.caption.bold())
                .foregroundStyle(.white)
            }
            .padding(25)
        }
    }
}

#Preview {
    VCCCardView(card: Card.mockCards[0])
}
