//
//  CSCarouselBodyView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 03.09.2024.
//

import SwiftUI

struct CSCarouselBodyView: View {

    @State private var offset: CGFloat = 0
    
    let previewModel: PreviewSampleModel

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            ZStack {
                Image(previewModel.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 8, height: size.height / 1.2)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Human Integration Supervisor")
                            .font(.title2.bold())
                            .kerning(1.5)

                        Text("The world's largest collection of animal facts, pictures and more!")
                    }
                    .foregroundStyle(.white)
                    .padding(.top)

                    Spacer(minLength: 0)

                    VStack(alignment: .leading, spacing: 30) {

                        HStack(spacing: 15) {
                            Image("girl_5")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())

                            VStack(alignment: .leading, spacing: 6) {
                                Text("Palantir")
                                    .font(.title2.bold())

                                Text("Iggdrassil")
                                    .foregroundStyle(.secondary)
                            }
                            .foregroundStyle(.black)
                        }

                        HStack {
                            VStack {
                                Text("1305")
                                    .font(.title2.bold())

                                Text("Posts")
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)

                            VStack {
                                Text("3202")
                                    .font(.title2.bold())

                                Text("Followers")
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)

                            VStack {
                                Text("2349")
                                    .font(.title2.bold())

                                Text("Following")
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .foregroundStyle(.black)
                    }
                    .padding(20)
                    .padding(.horizontal, 10)
                    .background(.white, in: RoundedRectangle(cornerRadius: 4))
                }
                .padding(20)
            }
            .frame(width: size.width, height: size.height)
        }
        .tag(previewModel.name)
    }
}

#Preview {
    CSContentView()
}
