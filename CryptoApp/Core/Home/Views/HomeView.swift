//
//  HomeView.swift
//  CryptoApp
//
//  Created by Apple on 19/11/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortFolio : Bool = false
    
    var body: some View {
        ZStack {
            
            Color.theme.background
            
            VStack {
                
                homeHeader

                Spacer(minLength: 0)
            }
           
        }
    }
}

#Preview {
    HomeView()
}


extension HomeView {
    
    private var homeHeader : some View {
        HStack {
            CircleButtonView(iconName: showPortFolio ? "plus" : "info")
                .animation(.none)
                .background {
                    CircleButtonAnimationView(animate: $showPortFolio)
                }
            Spacer()
            Text(showPortFolio ? "Portfolio" : "Live Scores")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortFolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortFolio.toggle()
                    }
                }
            
        }
        .padding(.horizontal)
    }
}
