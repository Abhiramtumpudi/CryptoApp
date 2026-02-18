//
//  Double.swift
//  CryptoApp
//
//  Created by Apple on 25/11/25.
//

import Foundation



extension Double {
    
    /// Converts a Double into currency with 2-6 decimal places
    /// ```
    ///  Converts 123.56 into $123.56
    ///  Converts 12.356 into $12.356
    ///  Converts 0.12356 into $0.12356
    ///
    ///  ```
    
    private var currentFormatter6 :  NumberFormatter {
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into currency with 2-6 decimal places
    /// ```
    ///  Converts 123.56 into "$123.56"
    ///  Converts 12.356 into "$12.356"
    ///  Converts 0.12356 into "$0.12356"
    ///
    ///  ```
    
     func asCurrencyWith6Decimeals()-> String {
        let nsNumber = NSNumber(value: self)
        return currentFormatter6.string(from: nsNumber) ?? "$0.00"
    }
    
    /// Converts a String to two points
    /// ```
    ///  Converts 1.23456 into "1.23"
    ///
    ///  ```
    
    func  asNumberString()-> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a String to two points
    /// ```
    ///  Converts 1.23456 into "1.23%"
    ///
    ///  ```
    
    func  asPercentageString()-> String {
        return asNumberString() + "%"
    }
    
    
    // Convert to Double to String

    
        
        func formattedWithAbbreviations() -> String {
            let number = abs(self)
            let sign = self < 0 ? "-" : ""
            
            switch number {
            case 1_000_000_000_000...:
                return sign + format(number / 1_000_000_000_000) + "Tr"
            case 1_000_000_000...:
                return sign + format(number / 1_000_000_000) + "Bn"
            case 1_000_000...:
                return sign + format(number / 1_000_000) + "M"
            case 1_000...:
                return sign + format(number / 1_000) + "K"
            default:
                return sign + format(number)
            }
        }
        
        private func format(_ value: Double) -> String {
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 0
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
        }
    }


