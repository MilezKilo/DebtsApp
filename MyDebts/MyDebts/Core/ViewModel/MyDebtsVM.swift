//
//  MyDebtsVM.swift
//  MyDebts
//
//  Created by Майлс on 24.02.2022.
//

import Foundation
import CoreData

class MyDebtsVM: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var myDebts: [MyDebtsEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "MyDebts")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Container loading error: \(error)")
            }
        }
        fetchDebts()
    }
    
    //MARK: - PRIVATE METHODS
    private func fetchDebts() {
        let request = NSFetchRequest<MyDebtsEntity>(entityName: "MyDebtsEntity")
        do {
            myDebts = try container.viewContext.fetch(request)
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
        let newDebt = MyDebtsEntity(context: container.viewContext)
        newDebt.name = name
        newDebt.value = value
        newDebt.overview = overview
        newDebt.date = date
        saveDebt()
    }
    func deleteDebt(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = myDebts[index]
        container.viewContext.delete(entity)
        saveDebt()
    }
    func returnAllDebts() -> String {
        var values: Double = 0
        for value in myDebts {
            values += value.value
        }
        return values.asValueWith2Decimals()
    }
}
