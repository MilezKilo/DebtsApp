//
//  Double.swift
//  MyDebts
//
//  Created by Майлс on 25.02.2022.
//

import Foundation

extension Double {
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asValueWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number) ?? "0.00"
    }
}
