//
//  ForgotPassword.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 27.06.2024.
//

import SwiftUI

struct ForgotPassword: View {

    @Binding var showResetView: Bool
    @State private var emailID: String = ""
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

            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)

            VStack(spacing: 25) {
                CustomTextField(sfIcon: "at", hint: "Email ID", value: $emailID)

                /// Login button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    /// code after the Link sent
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        /// showing the Reset view
                        showResetView.toggle()
                    }
                }
                .hSpacing(.trailing)
                /// disabling until the data is entered
                .disableWithOpacity(emailID.isEmpty)

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
