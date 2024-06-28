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

    @FocusState private var isKeyboardShowing: Bool

    var body: some View {
        VStack {
            Text("Verify OTP")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)


            HStack(spacing: 0) {
                ForEach(0..<otpDigitsCount, id:\.self) { index in
                    OTPTextBox(index)
                }
            }
            .background {
                TextField("", text: $otpText.limit(6))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            }
            .contentShape(Rectangle())
            .onTapGesture { isKeyboardShowing.toggle() }
            .padding(.bottom, 20)
            .padding(.top, 10)

            Button {

            } label: {
                Text("Verify")
                    .fontWeight(.bold)
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
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(.gray, lineWidth: 0.5)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OTPContentView()
}
