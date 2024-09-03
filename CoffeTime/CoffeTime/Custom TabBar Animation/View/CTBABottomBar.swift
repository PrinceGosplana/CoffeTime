//
//  CTBABottomBar.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 02.09.2024.
//

import SwiftUI

struct CTBABottomBar: View {

    @EnvironmentObject var bottomBarModel: CTBABottomBarViewModel

    @Namespace var animation
    @FocusState var showKeyboard: Bool
    
    var isFloating: Bool {
        bottomBarModel.tabState == .floating
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: isFloating ? 12 : 0, style: .continuous)
                .fill(.regularMaterial)
                .preferredColorScheme(isFloating ? .dark : .light)

            HStack(spacing: 15) {

                if isFloating {
                    Button {

                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .tint(.primary)
                    }
                    .padding(.trailing, 10)

                    Button {

                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .tint(.primary)
                    }

                }

                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.callout)
                        .foregroundStyle(.primary)

                    if isFloating {
                        TextField("", text: $bottomBarModel.searchText)
                            .matchedGeometryEffect(id: "SearchField", in: animation)
                            .focused($showKeyboard)
                        /// Keyboard button
                            .submitLabel(.go)
                    } else {
                        Text(bottomBarModel.searchText)
                            .matchedGeometryEffect(id: "SearchField", in: animation)
                    }

                    Image(systemName: "lock")
                        .symbolVariant(.fill)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .offset(y: isFloating ? 0 : -10)
                .frame(maxWidth: isFloating ? nil : 200)

                if isFloating {
                    Button {

                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title2)
                            .tint(.primary)
                    }

                    Button {

                    } label: {
                        Image(systemName: "square.on.square")
                            .font(.title2)
                            .tint(.primary)
                    }
                }
            }
            .preferredColorScheme(isFloating ? .dark : .light)
            .padding(.horizontal)
        }
        .frame(height: 60)
        .padding([.horizontal], isFloating ? 15 : 0)
        .frame(maxHeight: .infinity, alignment: showKeyboard ? .top : .bottom)
        /// When expanded go back to floating
        .onTapGesture {
            withAnimation(.easeOut.speed(1.5)) {
                bottomBarModel.tabState = .floating
            }
        }
        .animation(.easeOut, value: showKeyboard)
    }
}

#Preview {
    CTBABottomBar()
        .environmentObject(CTBABottomBarViewModel())
}
