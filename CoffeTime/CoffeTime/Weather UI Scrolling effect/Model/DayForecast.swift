//
//  DayForecast.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 01.09.2024.
//

import SwiftUI

struct DayForecast: Identifiable {
    let id = UUID()
    let day: String
    let celsius: CGFloat
    let image: String
}

extension DayForecast {
    static let mock: [DayForecast] = [
        .init(day: "Today", celsius: 25, image: "sun.min"),
        .init(day: "Wed", celsius: 22, image: "cloud.sun"),
        .init(day: "Tue", celsius: 24, image: "cloud.sun.bolt"),
        .init(day: "Thu", celsius: 20, image: "sun.max"),
        .init(day: "Fri", celsius: 19, image: "cloud.sun"),
        .init(day: "Sat", celsius: 21, image: "cloud.sun"),
        .init(day: "Sun", celsius: 21, image: "sun.max"),
        .init(day: "Mon", celsius: 22, image: "sun.max"),
        .init(day: "Tue", celsius: 23, image: "cloud.sun.bolt"),
        .init(day: "Wed", celsius: 24, image: "sun.min")
    ]
}
