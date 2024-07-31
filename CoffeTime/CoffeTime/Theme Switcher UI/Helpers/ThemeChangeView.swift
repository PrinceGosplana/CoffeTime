//
//  ThemeChangeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.07.2024.
//

import SwiftUI

struct ThemeChangeView: View {
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: TCTheme = .systemDefault
    /// For sliding effect
    @Namespace private var animation

    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(userTheme.color(scheme).gradient)
                .frame(width: 150, height: 150)

            Text("Choose a Style")
                .font(.title2.bold())
                .padding(.top, 25)

            Text("Pop or subtle, Day or night.\nCustomize your interface.")
                .multilineTextAlignment(.center)

            /// Custom segmented picker
            HStack(spacing: 0) {
                ForEach(TCTheme.allCases, id: \.rawValue) { theme in
                    Text(theme.rawValue)
                        .padding(.vertical, 10)
                        .frame(width: 100)
                        .background {
                            ZStack {
                                if userTheme == theme {
                                    Capsule()
                                        .fill(Color(.secondarySystemGroupedBackground))
                                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                }
                            }
                            .animation(.snappy, value: userTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            userTheme = theme
                        }
                }
            }
            .padding(3)
            .background(.primary.opacity(0.06), in: .capsule)
            .padding(.top, 20)
        }
    }
}

#Preview {
    ThemeChangeContentView()
}
