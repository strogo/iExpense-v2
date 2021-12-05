//
//  ExpenseItem.swift
//  iExpense-v2
//
//  Created by Palino on 05/12/2021.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
