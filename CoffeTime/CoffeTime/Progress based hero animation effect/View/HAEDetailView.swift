//
//  HAEDetailView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 14.07.2024.
//

import SwiftUI

struct HAEDetailView: View {

    @Binding var selectedProfile: HeroProfile?
    @Binding var heroProgress: CGFloat
    @Binding var showDetail: Bool
    @Binding var showHeroView: Bool

    /// Color scheme based background color
    @Environment(\.colorScheme) private var scheme
    /// Gesture properties
    @GestureState private var isDragging = false
    @State private var offset: CGFloat = .zero

    var body: some View {
        if let selectedProfile, showDetail {
            GeometryReader {
                let size = $0.size

                ScrollView(.vertical) {
                    Rectangle()
                        .fill(.clear)
                        .overlay {
                            if !showHeroView {
                                Image(selectedProfile.profilePicture)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: 400)
                                    .clipShape(.rect(cornerRadius: 25))
                                    .transition(.identity)
                            }
                        }
                        .frame(height: 400)

                    /// Destination anchor frame
                        .anchorPreference(key: AnchorKey.self, value: .bounds, transform: { anchor in
                            ["DESTINATION": anchor]
                        })
                        .visualEffect { content, geometryProxy in
                            content
                                .offset(y: geometryProxy.frame(in: .scrollView).minY > 0 ? -geometryProxy.frame(in: .scrollView).minY : 0)
                        }
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea()
                .frame(width: size.width, height: size.height)
                .background {
                    Rectangle()
                        .fill(scheme == .dark ? .black : .white)
                        .ignoresSafeArea()
                }
                .overlay(alignment: .topLeading) {
                    Button {
                        showHeroView = true
                        withAnimation(.snappy(duration: 0.35, extraBounce: 0), completionCriteria: .logicallyComplete) {
                            heroProgress = 0.0
                        } completion: {
                            showDetail = false
                            self.selectedProfile = nil
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .imageScale(.medium)
                            .contentShape(.rect)
                            .foregroundStyle(.white, .black)
                    }
                    .buttonStyle(.plain)
                    .padding()
                    .opacity(showHeroView ? 0 : 1)
                    .animation(.snappy(duration: 0.2, extraBounce: 0), value: showHeroView)
                }
                .offset(x: size.width - (size.width * heroProgress))
                .overlay(alignment: .leading) {
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 10)
                        .contentShape(.rect)
                        .gesture(
                            DragGesture()
                                .updating($isDragging, body: { _, out, _ in
                                    out = true
                                })
                                .onChanged({ value in
                                    var transition = value.translation.width
                                    transition = isDragging ? transition : .zero
                                    transition = transition > 0 ?  transition : 0
                                    /// converting into progress
                                    let dragProgress = 1.0 - (transition / size.width)
                                    /// limiting progress btw 0 - 1
                                    let cappedProgress = min(max(0, dragProgress), 1)
                                    heroProgress = cappedProgress
                                    offset = transition
                                    /// when the gesture is started to dismiss the view, the hero layer view will be enabled, and thus we can see the transition from the destination view to the source view
                                    if !showHeroView {
                                        showHeroView = true
                                    }
                                })
                                .onEnded({ value in
                                    /// closing/resetting based of end target
                                    let velocity = value.velocity.width

                                    if (offset + velocity) > (size.width * 0.8) {
                                        /// close view
                                        withAnimation(.snappy(duration: 0.35, extraBounce: 0), completionCriteria: .logicallyComplete) {
                                            heroProgress = .zero
                                        } completion: {
                                            offset = .zero
                                            showDetail = false
                                            showHeroView = true
                                            self.selectedProfile = nil
                                        }
                                    } else {
                                        /// reset
                                        withAnimation(.snappy(duration: 0.35, extraBounce: 0), completionCriteria: .logicallyComplete) {
                                            heroProgress = 1.0
                                            offset = .zero
                                        } completion: {
                                            showHeroView = false
                                        }
                                    }
                                })
                            )
                }
            }
        }
    }
}

#Preview {
    HAEDetailView(selectedProfile: .constant(HeroProfile.mocks[0]), heroProgress: .constant(1.0), showDetail: .constant(true), showHeroView: .constant(true))
}
