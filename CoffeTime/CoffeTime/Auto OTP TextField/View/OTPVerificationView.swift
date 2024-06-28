//
//  OTPVerificationView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 28.06.2024.
//

import SwiftUI

struct OTPVerificationView: View {

    @State var otpText: String = ""

    var body: some View {
        VStack {
            Text("Verify OTP")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)

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
        }
        .padding(.all)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    OTPContentView()
}
