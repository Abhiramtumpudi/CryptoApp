//
//  DismissKeyboard.swift
//  CryptoApp
//
//  Created by Apple on 16/01/26.
//

import Foundation
import SwiftUI

extension UIApplication {
    
     func endEditing() {
         sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
