//
//  ContentView.swift
//  iExpense-v2
//
//  Created by Palino on 05/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(expenses.items, id: \.id) { item in
                        if item.type == "Personal" {
                            HStack {
                                VStack(alignment: . leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                    
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                                    .foregroundColor(colorStyle(amount: item.amount))
                                
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section("Business") {
                    ForEach(expenses.items, id: \.id) { item in
                        if item.type == "Business" {
                            HStack {
                                VStack(alignment: . leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                    
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                                    .foregroundColor(colorStyle(amount: item.amount))
                                
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func colorStyle(amount: Double) -> Color? {
        var col: Color = .black
        
        if amount >= 100 { col = .red }
        else if amount <= 10 { col = .green }
        else { col = .black }
        
        return col
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
