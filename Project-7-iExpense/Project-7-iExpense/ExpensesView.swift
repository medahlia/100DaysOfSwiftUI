//
//  ItemsView.swift
//  Project-7-iExpense
//
//  Created by Home on 17.06.2026.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                .padding()
                .background(color(for: item.amount))
                .clipShape(.rect(cornerRadius: 10))
            }
            .onDelete(perform: removeItems)
        }
    }
    
    init(filterType: String?) {
        if let filterType {
            _expenses = Query(
                filter: #Predicate<ExpenseItem> { item in
                    item.type == filterType
                }
            )
        } else {
            _expenses = Query()
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(expenses[index])
        }
    }
    
    func color(for amount: Double) -> Color {
        switch amount {
        case ...10:
            return Color("GreenColor")
        case 11...100:
            return Color("YellowColor")
        default:
            return Color("OrangeColor")
        }
    }
}

#Preview {
    ExpensesView(filterType: "Personal")
}
