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

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Hello there!")
                        .font(.largeTitle.bold())
                        .padding(.horizontal, 15)

                    GeometryReader {
                        let rect = $0.frame(in: .scrollView)
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
}

#Preview {
    CSAContentView()
}
