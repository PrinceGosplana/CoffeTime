//
//  OTPTextBox.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 28.06.2024.
//

import SwiftUI

struct OTPTextBox: View {
    let index: Int
    let otpTextCount: Int

    var body: some View {
        ZStack {
            if otpTextCount > index {

            } else {
                Text("")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(.gray, lineWidth: 0.5)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OTPTextBox(index: 0, otpTextCount: 6)
}
