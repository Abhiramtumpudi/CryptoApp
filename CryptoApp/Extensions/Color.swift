//
//  Color.swift
//  CryptoApp
//
//  Created by Apple on 17/11/25.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}


struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let redColor = Color("SecondaryTextColor")
}
