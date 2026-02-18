import SwiftUI

struct AddTransactionView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: FinanceViewModel
    
    @State private var title = ""
    @State private var amount = ""
    @State private var category = "Food"
    @State private var isIncome = false
    
    let categories = ["Food", "Transport", "Shopping", "Bills", "Salary", "Other"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Details")) {
                    
                    TextField("Title", text: $title)
                    
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { cat in
                            Text(cat)
                        }
                    }
                    
                    Toggle("Income?", isOn: $isIncome)
                }
            }
            .navigationTitle("Add Transaction")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if let doubleAmount = Double(amount),
                           !title.isEmpty {
                            viewModel.addTransaction(
                                title: title,
                                amount: doubleAmount,
                                category: category,
                                isIncome: isIncome
                            )
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
