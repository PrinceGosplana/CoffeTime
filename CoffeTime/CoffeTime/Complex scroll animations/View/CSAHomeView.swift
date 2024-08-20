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
    @State private var activeCard: UUID?

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
                        let minY = rect.minY.rounded()

                        /// card view
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(CSACard.cards) { card in
                                    ZStack {
                                        if minY == 75.0 {
                                            /// Not scrolled
                                            /// /// Showing all cards
                                            CardView(card)
                                        } else {
                                            /// scrolled
                                            /// Showing only selected card
                                            if activeCard == card.id {
                                                CardView(card)
                                            } else {
                                                Rectangle()
                                                    .fill(.clear)
                                            }
                                        }
                                    }
                                    .containerRelativeFrame(.horizontal)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollPosition(id: $activeCard)
                        .scrollTargetBehavior(.paging)
                        .scrollClipDisabled()
                        .scrollIndicators(.hidden)
                        .scrollDisabled(minY != 75.0)
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
                .mask {
                    Rectangle()
                        .visualEffect { content, proxy in
                            content
                                .offset(y: backgroundLimitOffset(proxy))
                        }
                }
                .background {

                    GeometryReader {
                        let rect = $0.frame(in: .scrollView)
                        let minY = min(rect.minY - 124, 0)
                        let progress = max(min(-minY / 25, 1), 0)

                        RoundedRectangle(cornerRadius: 30 * progress, style: .continuous)
                            .fill(scheme == .dark ? .black : .white)
                        /// Limiting background scroll bellow the header
                            .visualEffect { content, proxy in
                                content
                                    .offset(y: backgroundLimitOffset(proxy))
                            }
                    }
                }
            }
            .padding(.vertical, 15)
        }
        .onAppear {
            if activeCard == nil {
                activeCard = CSACard.cards.first?.id
            }
        }
        .onChange(of: activeCard) { oldValue, newValue in
            withAnimation(.snappy) {
                allExpenses = Expense.expenses.shuffled()
            }
        }
    }

    /// Background limit offset
    private func backgroundLimitOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        return minY < 100 ? -minY + 100 : 0
    }

    /// Expense card view
    private func ExpenseCardView(_ expense: Expense) -> some View {
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
    private func CardView(_ card: CSACard) -> some View {
        GeometryReader {
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            let minY = rect.minY
            let topValue: CGFloat = 75.0
            let offset = min(minY - topValue, 0)
            let progress = max(min(-offset / topValue, 1), 0)
            let scale: CGFloat = 1 + progress

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
                    .scaleEffect(scale, anchor: .bottom)

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
                .offset(y: progress * -25)
            }
            .offset(y: -offset)
            .offset(y: progress * -topValue)
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    CSAContentView()
}
