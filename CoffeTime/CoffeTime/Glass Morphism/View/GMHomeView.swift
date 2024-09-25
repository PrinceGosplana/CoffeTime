//
//  GMHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 25.09.2024.
//

import SwiftUI

struct GMHomeView: View {
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
        }
    }
}

#Preview {
    GMContentView()
}
