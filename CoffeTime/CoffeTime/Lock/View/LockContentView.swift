//
//  LockContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 21.07.2024.
//

import SwiftUI

struct LockContentView: View {
    var body: some View {
        LockView(lockType: .biometric, lockPin: "0320", isEnabled: true) {
            VStack(spacing: 15) {
                Image(systemName: "globe")
                    .imageScale(.large)

                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    LockContentView()
}
