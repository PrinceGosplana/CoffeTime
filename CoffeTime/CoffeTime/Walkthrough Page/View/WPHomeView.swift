//
//  WPHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 26.09.2024.
//

import SwiftUI

struct WPHomeView: View {
    
    let screenSize: CGSize
    @State var offset: CGFloat = 0
    
    /// Expanding index based on
    private var getIndex: Int {
        Int(round(offset / screenSize.width))
    }
    
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                Image(.pacmanBlack128)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.white)
                    .frame(width: 30, height: 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            WPOffsetPageTabView(offset: $offset) {
                
                HStack(spacing: 0) {
                    ForEach(WPIntro.mocks) { intro in
                        VStack {
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height / 3)
                            
                            VStack(alignment: .leading, spacing: 22) {
                                Text(intro.title)
                                    .font(.largeTitle.bold())
                                
                                Text(intro.description)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.top, 50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        .frame(width: screenSize.width)
                    }
                }
            }
            
            /// Animated indicator
            HStack(alignment: .bottom) {
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .padding(20)
                        .background(
                            WPIntro.mocks[getIndex].color,
                            in: Circle()
                        )
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    WPContentView()
}
