//
//  LoginView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.06.2024.
//

import SwiftUI

struct LoginView: View {

    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showForgotPasswordView: Bool = false
    /// Reset password view (with new password and confirmation password view)
    @State private var showResetView: Bool = false

    @Binding var showSignup: Bool
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer(minLength: 0)

            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)

            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)

            VStack(spacing: 25) {
                CustomTextField(sfIcon: "at", hint: "Email ID", value: $emailID)

                CustomTextField(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)

                Button("Forgot Password") {
                    showForgotPasswordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.appYellow)
                .hSpacing(.trailing)

                /// Login button
                GradientButton(title: "Login", icon: "arrow.right") {
                    askOTP.toggle()
                }
                .hSpacing(.trailing)
                /// disabling until the data is entered
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)

            }
            .padding(.top, 20)

            Spacer(minLength: 0)

            HStack(spacing: 6) {
                Text("Don't have an account?")
                    .foregroundStyle(.gray)

                Button("SignUP") {
                    showSignup.toggle()
                }
                .fontWeight(.bold)
                .tint(.appYellow)
            }
            .font(.callout)
            .hSpacing()

        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        /// asking email id for sending reset link
        .sheet(isPresented: $showForgotPasswordView) {
            if #available(iOS 16.4, *) {
                /// since I wanted a custom sheet corner radius
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
            }
        }
        /// reseting new password
        .sheet(isPresented: $showResetView) {
            if #available(iOS 16.4, *) {
                /// since I wanted a custom sheet corner radius
                PasswordResetView()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                PasswordResetView()
                    .presentationDetents([.height(350)])
            }
        }
        /// OTP Prompt
        .sheet(isPresented: $askOTP) {
            if #available(iOS 16.4, *) {
                /// since I wanted a custom sheet corner radius
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
            }
        }
    }
}

#Preview {
    LoginContentView()
}
