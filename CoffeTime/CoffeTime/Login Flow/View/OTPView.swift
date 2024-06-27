//
//  OTPView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 27.06.2024.
//

import SwiftUI

struct OTPView: View {

    @Binding var otpText: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
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

                GradientButton(title: "Send Link", icon: "arrow.right") {

                }
                .hSpacing(.trailing)
                /// disabling until the data is entered
                .disableWithOpacity(otpText.isEmpty)
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
