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
            HackerTextView(
                text: "Made with SwiftUI\nFor people",
                trigger: trigger,
                transition: .interpolate,// .numericText(),// .identity,
                speed: 0.06
            )
            .font(.largeTitle.bold())
            .lineLimit(2)

            Button {
                trigger.toggle()
            } label: {
                Text("Trigger")
                    .fontWeight(.semibold)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 2)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .frame(maxWidth: .infinity)
            .padding(.top, 30)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HackerTextContentView()
}
