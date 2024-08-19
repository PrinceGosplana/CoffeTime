//
//  Expense.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 19.08.2024.
//

import SwiftUI

/// Sample Expenses
struct Expense: Identifiable {
    var id = UUID()
    let amountSpent: String
    let product: String
    let spendType: String
}

extension Expense {
    static let expenses: [Expense] = [
        .init(amountSpent: "$128", product: "Amazon Purchase", spendType: "Groceries"),
        .init(amountSpent: "$10", product: "Youtube Premium", spendType: "Streaming"),
        .init(amountSpent: "$10", product: "Dribble", spendType: "Membership"),
        .init(amountSpent: "$99", product: "Magic Keyboard", spendType: "Products"),
        .init(amountSpent: "$9", product: "Patreon", spendType: "Membership"),
        .init(amountSpent: "$100", product: "Instagram", spendType: "Ad Publish"),
        .init(amountSpent: "$15", product: "Netflix", spendType: "Streaming"),
        .init(amountSpent: "$348", product: "Photoshop", spendType: "Editing"),
        .init(amountSpent: "$99", product: "Figma", spendType: "Pro Member"),
        .init(amountSpent: "$89", product: "Magic Mouse", spendType: "Products"),
        .init(amountSpent: "$1200", product: "Studio Display", spendType: "Products"),
        .init(amountSpent: "$39", product: "Sketch Subscription", spendType: "Membership")
    ]
}
