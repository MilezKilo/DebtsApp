//
//  DebtsToMeVM.swift
//  MyDebts
//
//  Created by Майлс on 24.02.2022.
//

import Foundation
import CoreData

class DebtsToMeVM: ObservableObject {
    
    var container: NSPersistentContainer
    @Published var debtsToMe: [DebtsToMeEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "DebtsToMe")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Container loading error: \(error)")
            }
        }
        fetchDebts()
    }
    
    //MARK: - PRIVATE METHODS
    private func fetchDebts() {
        let request = NSFetchRequest<DebtsToMeEntity>(entityName: "DebtsToMeEntity")
        do {
            debtsToMe = try container.viewContext.fetch(request)
        } catch let error {
            print("Fetching error: \(error)")
        }
    }
    private func saveDebt() {
        do {
            try container.viewContext.save()
            fetchDebts()
        } catch let error {
            print("Saving data error: \(error)")
        }
    }
    
    //MARK: - PUBLIC METHODS
    func addDebt(name: String, value: Double, overview: String, date: Date) {
        let newDebt = DebtsToMeEntity(context: container.viewContext)
        newDebt.name = name
        newDebt.value = value
        newDebt.overview = overview
        newDebt.date = date
        saveDebt()
    }
    func deleteDebt(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = debtsToMe[index]
        container.viewContext.delete(entity)
        saveDebt()
    }
    func returnAllDebts() -> String {
        var values: Double = 0
        for debt in debtsToMe {
            values += debt.value
        }
        return values.asValueWith2Decimals()
    }
}
