//
//  DummySection.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 13.06.2024.
//

import SwiftUI

struct DummySection: View {

    let title: String
    let isLong: Bool

    init(title: String, isLong: Bool = false) {
        self.title = title
        self.isLong = isLong
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title.bold())

            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \(isLong ? "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged" : "")")
                .multilineTextAlignment(.leading)
                .kerning(1.2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    DummySection(title: "Test")
}
