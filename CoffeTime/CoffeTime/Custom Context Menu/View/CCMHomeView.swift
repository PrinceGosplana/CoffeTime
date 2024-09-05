//
//  CCMHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.09.2024.
//

import SwiftUI

struct CCMHomeView: View {

    @State var onEnded = false

    var body: some View {
        NavigationStack {
            ZStack {
                CustomContextMenu {
                    /// content
                    Label {
                        Text("Unlock me")
                    } icon: {
                        Image(systemName: "lock.fill")
                    }
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                } preview: {
                    Image(.boJack0)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } actions: {
                    let like = UIAction(title: "Like Me", image: UIImage(systemName: "suit.heart.fill")) { _ in
                        print("like")
                    }

                    let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up.fill")) { _ in
                        print("share")
                    }

                    return UIMenu(title: "", children: [like, share])
                } onEnd: {
                    withAnimation {
                        onEnded.toggle()
                    }
                }

                if onEnded {
                    GeometryReader { proxy in
                        let size = proxy.size

                        Image(.boJack0)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                    }
                    .ignoresSafeArea(.all, edges: .bottom)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Close") {
                                withAnimation {
                                    onEnded.toggle()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Custom Context Menu")
        }
    }
}

#Preview {
    CCMContentView()
}
