import Foundation

struct Transaction: Identifiable, Codable {
    let id: UUID
    let title: String
    let amount: Double
    let category: String
    let date: Date
    let isIncome: Bool
}

