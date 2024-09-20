//
//  ISStoryViewModel.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 20.09.2024.
//

import Foundation

final class ISStoryViewModel: ObservableObject {
    @Published var currentStory: String = ""
    @Published var showStory: Bool = false
    @Published var stories: [ISStoryBundle] = [ISStoryBundle.yellowUser, ISStoryBundle.darkUser]
}
