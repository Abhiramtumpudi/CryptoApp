//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Apple on 12/11/25.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
