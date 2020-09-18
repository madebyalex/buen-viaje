//
//  Int+Ext.swift
//  buen-viaje
//
//  Created by Alexander on 19.09.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
//

import Foundation

extension Int {
    func formatToCurrencyString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        
        let nsNum = NSNumber(integerLiteral: self / 100)
        return formatter.string(from: nsNum) ?? "$$$"
    }
}
