//
//  OTPVerificationView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 28.06.2024.
//

import SwiftUI

struct OTPVerificationView: View {

    @State var otpText: String = ""
    private var otpDigitsCount = 6

    var body: some View {
        VStack {
            Text("Verify OTP")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)


            HStack(spacing: 0) {
                ForEach(0..<otpDigitsCount, id:\.self) { index in
                    OTPTextBox(index: index, otpTextCount: otpDigitsCount)
                }
            }
            .padding(.bottom, 20)
            .padding(.top, 10)

            TextField("", text: $otpText)

            Button {

            } label: {
                Text("Verify")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(.blue)
                    }
            }
            .disableWithOpacity(otpText.count < 6)
        }
        .padding(.all)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    OTPContentView()
}
