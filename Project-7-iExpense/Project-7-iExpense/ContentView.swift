import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    @State private var showingAddExpense = false
    
    @State private var filterType: String? = nil
    
    var body: some View {
        NavigationStack {
            ExpensesView(filterType: filterType)
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
                
                Menu("All", systemImage: "line.3.horizontal.decrease.circle") {
                    Button("All") {
                        filterType = nil
                    }
                    
                    Button("Business") {
                        filterType = "Business"
                    }
                    
                    Button("Personal") {
                        filterType = "Personal"
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
            }
        }
    }
}

#Preview {
    ContentView()
}
