//
//  HackerTextContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.06.2024.
//

import SwiftUI

struct HackerTextContentView: View {
    @State private var trigger: Bool = false
    @State private var text = "Hello, World!"
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HackerTextView(
                text: text,
                trigger: trigger,
                transition: .interpolate,// .numericText(),// .identity,
                speed: 0.06
            )
            .font(.largeTitle.bold())
            .lineLimit(2)

            Button {
                changeText()
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

    private func changeText() {
        if text == "Hello, World!" {
            text = "This is Hacker\nText View."
        } else if text == "This is Hacker\nText View." {
            text = "Made with SwiftUI\nFor The Future"
        } else {
            text = "Hello, World!"
        }
    }
}

#Preview {
    HackerTextContentView()
}
