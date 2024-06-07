//
//  GTTextView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 07.06.2024.
//

import SwiftUI

struct GTTextView: View {
    let text: String

    var body: some View {
        Text(text)
    }
}

#Preview {
    GTTextView(text: "Test")
}
