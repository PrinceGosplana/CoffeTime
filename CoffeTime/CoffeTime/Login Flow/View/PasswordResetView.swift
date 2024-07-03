//
//  PasswordResetView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 27.06.2024.
//

import SwiftUI

struct PasswordResetView: View {

    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }

            Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)

            VStack(spacing: 25) {
                CustomTextField(sfIcon: "lock", hint: "Password", value: $password)

                CustomTextField(sfIcon: "lock", hint: "Confirm Password", value: $confirmPassword)
                    .padding(.top, 5)

                /// Login button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    /// Reset Password
                    dismiss()
                }
                .hSpacing(.trailing)
                /// disabling until the data is entered
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)

            }
            .padding(.top, 20)
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
