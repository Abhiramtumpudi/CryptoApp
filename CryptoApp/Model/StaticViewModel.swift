//
//  StaticViewModel.swift
//  CryptoApp
//
//  Created by Apple on 09/02/26.
//

import Foundation

struct StaticViewModel : Identifiable {
    
    let id = UUID().uuidString
    let title : String
    let value : String
    let percentageChange : Double?
    
    init(title : String , value: String , percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
}
