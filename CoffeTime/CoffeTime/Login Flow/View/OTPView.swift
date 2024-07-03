//
//  OTPView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 27.06.2024.
//

import SwiftUI

struct OTPView: View {

    @Binding var otpText: String
    @Binding var openMainScreen: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
                otpText = ""
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 15)

            Text("Enter OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)

            Text("An 6 digit code has been sent to your Email ID.")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)


            VStack(spacing: 25) {
                /// put here OTPVerification view
                LFOTPVerificationView(otpText: $otpText)

                GradientButton(title: "Send Link", icon: "arrow.right") {
                    dismiss()
                    openMainScreen.toggle()
                }
                .hSpacing(.trailing)
                /// disabling until the data is entered
                .disableWithOpacity(otpText.count < 6)
            }
            .padding(.top, 20)

            Spacer(minLength: 0)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        /// since this is going to be a Sheet.
        .interactiveDismissDisabled()
    }
}

#Preview {
    LoginContentView()
}
