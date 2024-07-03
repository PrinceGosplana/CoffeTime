//
//  CustomTabbarContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.07.2024.
//

import SwiftUI

struct CustomTabbarContentView: View {
    var body: some View {
        CustomTabbarHomeView()
            .preferredColorScheme(.light)
    }
}

#Preview {
    CustomTabbarContentView()
}
