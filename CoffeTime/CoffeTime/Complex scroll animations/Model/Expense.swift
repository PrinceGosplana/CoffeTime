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
    let spendTypes: String
}

extension Expense {
    static let expenses: [Expense] = [
        .init(amountSpent: "$128", product: "Amazon Purchase", spendTypes: "Groceries"),
        .init(amountSpent: "$10", product: "Youtube Premium", spendTypes: "Streaming"),
        .init(amountSpent: "$10", product: "Dribble", spendTypes: "Membership"),
        .init(amountSpent: "$99", product: "Magic Keyboard", spendTypes: "Products"),
        .init(amountSpent: "$9", product: "Patreon", spendTypes: "Membership"),
        .init(amountSpent: "$100", product: "Instagram", spendTypes: "Ad Publish"),
        .init(amountSpent: "$15", product: "Netflix", spendTypes: "Streaming"),
        .init(amountSpent: "$348", product: "Photoshop", spendTypes: "Editing"),
        .init(amountSpent: "$99", product: "Figma", spendTypes: "Pro Member"),
        .init(amountSpent: "$89", product: "Magic Mouse", spendTypes: "Products"),
        .init(amountSpent: "$1200", product: "Studio Display", spendTypes: "Products"),
        .init(amountSpent: "$39", product: "Sketch Subscription", spendTypes: "Membership")
    ]
}
