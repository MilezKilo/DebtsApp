//
//  DateFormatter.swift
//  MyDebts
//
//  Created by Майлс on 25.02.2022.
//

import Foundation

extension DateFormatter {
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
}
