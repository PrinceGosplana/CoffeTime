//
//  LFOTPVerificationView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 28.06.2024.
//

import SwiftUI

struct LFOTPVerificationView: View {

    @Binding var otpText: String
     var otpDigitsCount = 6

    @FocusState private var isKeyboardShowing: Bool

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<otpDigitsCount, id: \.self) { index in
                OTPTextBox(index)
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    isKeyboardShowing.toggle()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }

    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            if otpText.count > index {
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text("")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            let status = (isKeyboardShowing && otpText.count == index)

            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? .black : .gray, lineWidth: status ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.2), value: status)
        }
        .frame(maxWidth: .infinity)
    }
}
