//
//  CSAHomeView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 19.08.2024.
//

import SwiftUI

struct CSAHomeView: View {

    /// View Properties
    @State private var allExpenses: [Expense] = []
    /// Environment values
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Hello there!")
                        .font(.largeTitle.bold())
                        .frame(height: 45)
                        .padding(.horizontal, 15)

                    GeometryReader {
                        let rect = $0.frame(in: .scrollView)

                        /// card view
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(CSACard.cards) {
                                    CardView($0)
                                        .containerRelativeFrame(.horizontal)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.paging)
                    }
                    .frame(height: 125)
                }

                LazyVStack(spacing: 15) {
                    Menu {

                    } label: {
                        HStack(spacing: 4) {
                            Text("Filter By")
                            Image(systemName: "chevron.down")
                        }
                        .font(.caption)
                        .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)

                    ForEach(allExpenses) { expense in
                        ExpenseCardView(expense)
                            .containerRelativeFrame(.horizontal)
                    }
                }
                .padding(15)
            }
            .padding(.vertical, 15)
        }
        .onAppear {
            allExpenses = Expense.expenses.shuffled()
        }
    }

    /// Expense card view
    func ExpenseCardView(_ expense: Expense) -> some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text(expense.product)
                    .font(.callout)
                    .fontWeight(.semibold)

                Text(expense.spendType)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }

            Spacer(minLength: 0)

            Text(expense.amountSpent)
                .fontWeight(.bold)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 6)
    }

    /// Card view
    func CardView(_ card: CSACard) -> some View {
        GeometryReader {
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            let minY = rect.minY
            let offset = min(minY - 75, 0)

            ZStack {
                Rectangle()
                    .fill(card.bgColor)
                    .overlay(alignment: .leading) {
                        Circle()
                            .fill(card.bgColor)
                            .overlay {
                                Circle()
                                    .fill(.white.opacity(0.2))
                            }
                            .scaleEffect(2, anchor: .topLeading)
                            .offset(x: -50, y: -40)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))

                VStack(alignment: .leading, spacing: 4) {
                    Spacer(minLength: 0)

                    Text("Current Balance")
                        .font(.callout)

                    Text(card.balance)
                        .font(.title.bold())
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
            }
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    CSAContentView()
}
