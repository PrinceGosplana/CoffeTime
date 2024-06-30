//
//  Signup.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 27.06.2024.
//

import SwiftUI

struct Signup: View {

    @State private var emailID: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""

    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    @Binding var showSignup: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
                showSignup.toggle()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 10)

            Text("SighUp")
                .font(.largeTitle)
                .fontWeight(.heavy)

            Text("Please sign up to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)

            VStack(spacing: 25) {
                CustomTextField(sfIcon: "at", hint: "Email ID", value: $emailID)

                CustomTextField(sfIcon: "person", hint: "Full Name", value: $fullName)
                    .padding(.top, 5)

                CustomTextField(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)

                /// SignUp button
                GradientButton(title: "Continue", icon: "arrow.right") {
                    askOTP.toggle()
                }
                .hSpacing(.trailing)
                /// disabling until the data is entered
                .disableWithOpacity(emailID.isEmpty || password.isEmpty || fullName.isEmpty)

            }
            .padding(.top, 20)

            Spacer(minLength: 0)

            HStack(spacing: 6) {
                Text("Already have an account?")
                    .foregroundStyle(.gray)

                Button("Login") {
                    showSignup.toggle()
                }
                .fontWeight(.bold)
                .tint(.appLightBrown)
            }
            .font(.callout)
            .hSpacing()

        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
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
