import SwiftUI
import Charts

// MARK: - Model
struct Transaction: Identifiable, Codable {
    let id: UUID
    let title: String
    let amount: Double
    let category: String
    let date: Date
    let isIncome: Bool
}

// MARK: - ViewModel
class FinanceViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    private let storageKey = "transactions_key"
    
    init() {
        load()
    }
    
    var balance: Double {
        transactions.reduce(0) {
            $0 + ($1.isIncome ? $1.amount : -$1.amount)
        }
    }
    
    var expenses: [Transaction] {
        transactions.filter { !$0.isIncome }
    }
    
    func addTransaction(title: String, amount: Double, category: String, isIncome: Bool) {
        let newTransaction = Transaction(
            id: UUID(),
            title: title,
            amount: amount,
            category: category,
            date: Date(),
            isIncome: isIncome
        )
        
        transactions.append(newTransaction)
        save()
    }
    
    func delete(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(transactions) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([Transaction].self, from: data) {
            transactions = decoded
        }
    }
}

// MARK: - Main View
struct ContentView: View {
    
    @StateObject private var viewModel = FinanceViewModel()
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // Balance Card
                VStack(spacing: 8) {
                    Text("Total Balance")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("$\(viewModel.balance, specifier: "%.2f")")
                        .font(.largeTitle.bold())
                        .foregroundColor(viewModel.balance >= 0 ? .green : .red)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .padding()
                
                // Chart
                if !viewModel.expenses.isEmpty {
                    Chart(viewModel.expenses) { item in
                        BarMark(
                            x: .value("Category", item.category),
                            y: .value("Amount", item.amount)
                        )
                    }
                    .frame(height: 200)
                    .padding()
                }
                
                // Transactions List
                List {
                    ForEach(viewModel.transactions) { transaction in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(transaction.title)
                                    .font(.headline)
                                Text(transaction.category)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Text("\(transaction.isIncome ? "+" : "-")$\(transaction.amount, specifier: "%.2f")")
                                .foregroundColor(transaction.isIncome ? .green : .red)
                        }
                    }
                    .onDelete(perform: viewModel.delete)
                }
                
            }
            .navigationTitle("FinTrack Lite")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddTransactionView(viewModel: viewModel)
            }
        }
    }
}

// MARK: - Add Transaction View
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
                        if let doubleAmount = Double(amount) {
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
