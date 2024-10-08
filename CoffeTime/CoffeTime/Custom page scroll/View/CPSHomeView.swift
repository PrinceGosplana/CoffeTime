//
//  CPSHomeView.swift
//  CoffeTime
//
//  Created by OLEKSANDR ISAIEV on 08.10.2024.
//

import SwiftUI

struct CPSHomeView: View {
    
    @State var albums: [CPSAlbum] = CPSAlbum.mocks
    @State var currentIndex: Int = 0
    @State var currentAlbum: CPSAlbum = CPSAlbum.mocks.first!
    
    private var titleString: AttributedString {
        var attString = AttributedString(stringLiteral: "My Library")
        if let range = attString.range(of: "Library") {
            attString[range].font = .largeTitle.bold()
        }
        return attString
    }
    
    var standView: some View {
        Rectangle()
            .fill(.white.opacity(0.6))
            .shadow(color: .black.opacity(0.6), radius: 20, x: 0, y: 5)
            .frame(height: 10)
            .overlay(alignment: .top) {
                Rectangle()
                    .fill(.white.opacity(0.75).gradient)
                    .frame(height: 385)
                /// 3D Rotation
                    .rotation3DEffect(.init(degrees: -98), axis: (x: 1, y: 0, z: 0), anchor: .top, anchorZ: 0.5, perspective: 1)
                    .shadow(color: .black.opacity(0.08), radius: 25, x: 0, y: 5)
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 15)
            }
    }
    
    var body: some View {
        VStack {
            Text(titleString)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                AlbumArtworkScroller()
                    .zIndex(1)
                standView
                    .zIndex(0)
            }
            .padding(.horizontal, -15)
            .frame(height: 250)
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"), ignoresSafeAreaEdges: .all)
    }
    
    /// Custom stroller animated view
    @ViewBuilder
    func AlbumArtworkScroller() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            LazyHStack(spacing: 0) {
                ForEach($albums) { $album in
                    HStack(spacing: 0) {
                        Image(album.albumImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160, height: 160)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 10)
                            .offset(y: -20)
                            .zIndex(1)
                        
                        Image("vinylRecord")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140, height: 140)
                            .overlay {
                                Image(album.albumImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }
                            .padding(.leading, -170)
                            .offset(y: -10)
                            .zIndex(0)
                    }
                    .frame(width: size.width)
                }
            }
        }
        .frame(height: 100)
    }
}

#Preview {
    CPSContentView()
}
