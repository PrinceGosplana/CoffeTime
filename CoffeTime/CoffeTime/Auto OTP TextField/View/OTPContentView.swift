//
//  OTPContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 28.06.2024.
//

import SwiftUI

struct OTPContentView: View {
    var body: some View {
        if #available(iOS 15, *) {
            NavigationView {
                OTPVerificationView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }
        } else {
            NavigationStack {
                OTPVerificationView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    OTPContentView()
}
