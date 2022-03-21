//
//  PreviewProvide.swift
//  MyDebts
//
//  Created by Майлс on 25.02.2022.
//

import SwiftUI
import CoreData

//MARK: - EXTENSION
extension PreviewProvider {
    static var devOne: DeveloperPreviewForMyDebt {
        return DeveloperPreviewForMyDebt.instance
    }
    
    static var devTwo: DeveloperPreviewForDebtToMe {
        return DeveloperPreviewForDebtToMe.instance
    }
}

//MARK: - STATIC PREVIEW FOR MY DEBT
class DeveloperPreviewForMyDebt {

    static let instance = DeveloperPreviewForMyDebt()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MyDebts")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Data loading error: \(error)")
            }
        }
    }

    func createFakeDebt() -> MyDebtsEntity {
        let newDebt = MyDebtsEntity(context: container.viewContext)
        newDebt.name = "Артур"
        newDebt.value = 1500.0
        newDebt.overview = "За пиццу"
        newDebt.date = Date()
        return newDebt
    }
}

//MARK: - STATIC PREVIEW FOR DEBT TO ME
class DeveloperPreviewForDebtToMe {
    
    static let instance = DeveloperPreviewForDebtToMe()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "DebtsToMe")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Data loading error: \(error)")
            }
        }
    }
    
    func createFakeDebt() -> DebtsToMeEntity {
        let newDebt = DebtsToMeEntity(context: container.viewContext)
        newDebt.name = "Кирилл"
        newDebt.value = 1500.0
        newDebt.overview = "За свет и воду"
        newDebt.date = Date()
        return newDebt
    }
}
