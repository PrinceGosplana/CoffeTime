//
//  HackerTextView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 05.06.2024.
//

import SwiftUI

struct HackerTextView: View {
    /// Config
    var text: String
    var trigger: Bool
    var transition: ContentTransition = .interpolate
    var duration: CGFloat = 1.0
    var speed: CGFloat = 0.1

    /// View properties
    @State private var animatedText: String = ""
    @State private var randomCharacters: [Character] = {
        let string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-?/#$%@!^&*()="
        return Array(string)
    }()

    var body: some View {
        Text(animatedText)
            .fontDesign(.monospaced)
            .truncationMode(.tail)
            .contentTransition(transition)
            .onAppear {
                guard animatedText.isEmpty else { return }
                setRandomCharacters()
            }
            .customOnChange(value: trigger) { newValue in
                animateText()
            }
    }

    private func animateText() {

    }

    private func setRandomCharacters() {
        animatedText = text
        for index in animatedText.indices {
            guard let randomCharacter = randomCharacters.randomElement() else { return }
            replaceCharacter(at: index, character: randomCharacter)
        }
    }

    /// This will ensure that when the view is animated, a random character won't overwrite the newlines and empty spaces
    /// Changes character at the given index
    func replaceCharacter(at index: String.Index, character: Character) {
        guard animatedText.indices.contains(index) else { return }
        let indexCharacter = String(animatedText[index])

        if indexCharacter.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            animatedText.replaceSubrange(index...index, with: String(character))
        }
    }
}

fileprivate extension View {
    @ViewBuilder
    func customOnChange<T: Equatable>(value: T, result: @escaping (T) -> ()) -> some View {
        if #available(iOS 17, *) {
            self
                .onChange(of: value) { oldValue, newValue in
                    result(newValue)
                }
        } else {
            self
                .onChange(of: value, perform:  { value in
                    result(value)
                })
        }
    }
}

#Preview {
    HackerTextContentView()
}
