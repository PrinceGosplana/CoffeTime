//
//  GMHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 25.09.2024.
//

import SwiftUI

struct GMHomeView: View {

    let subtitle = "Start now and learn more about \n local weather instantly"
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color("AppBrown"),
                    Color("AppLightBrown")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            GeometryReader { proxy in
                let size = proxy.size

                Color.black
                    .opacity(0.7)
                    .blur(radius: 200)
                    .ignoresSafeArea()

                Circle()
                    .fill(Color("Moon"))
                    .padding(50)
                    .blur(radius: 120)
                    .offset(x: -size.width / 1.8, y: -size.height / 5)

                Circle()
                    .fill(Color("AppYellow"))
                    .padding(50)
                    .blur(radius: 150)
                    .offset(x: size.width / 1.8, y: -size.height / 2)

                Circle()
                    .fill(Color("AppYellow"))
                    .padding(50)
                    .blur(radius: 90)
                    .offset(x: size.width / 1.8, y: size.height / 2)

                Circle()
                    .fill(Color.purple)
                    .padding(100)
                    .blur(radius: 110)
                    .offset(x: size.width / 1.8, y: size.height / 2)

                Circle()
                    .fill(Color.purple)
                    .padding(100)
                    .blur(radius: 110)
                    .offset(x: -size.width / 1.8, y: size.height / 2)
            }

            /// Main content
            VStack {

                Spacer(minLength: 10)
                
                Text("Known Everything\nabout the weather")
                    .font(.system(size: 40, weight: .bold))

                Text(getAttributedString())
                    .fontWeight(.semibold)
                    .kerning(1.1)
                    .padding(.top, 10)

                Button {

                } label: {
                    Text("Get Started")
                        .font(.title.bold())
                        .padding(.vertical, 22)
                        .frame(maxWidth: .infinity)
                        .background(
                            .linearGradient(
                                colors: [
                                    Color("AppBrown"),
                                    Color("AppLightBrown")
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            ,
                            in: RoundedRectangle(cornerRadius: 20)
                        )
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 20)

                Button {

                } label: {
                    Text("Already have an account?")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                }
            }
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .padding()
        }
    }

    /// AttributedString from iOS 15
    private func getAttributedString() -> AttributedString {
        var attStr = AttributedString(subtitle)
        attStr.foregroundColor = .gray

        /// converting only 'local weather'
        if let range = attStr.range(of: "local weather") {
            attStr[range].foregroundColor = .white
        }
        return attStr
    }
}

#Preview {
    GMContentView()
}
