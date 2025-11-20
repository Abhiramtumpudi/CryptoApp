//
//  ContentView.swift
//  CryptoApp
//
//  Created by Apple on 12/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Header")
                Spacer(minLength: 8)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .navigationBarHidden(true)
    }
}
