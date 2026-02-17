import Foundation
import SwiftUI

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
