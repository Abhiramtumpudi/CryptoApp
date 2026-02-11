//
//  HomeView.swift
//  CryptoApp
//
//  Created by Apple on 19/11/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @State private var showPortFolio : Bool = false
    
    var body: some View {
        ZStack {
            
            Color.theme.background
                .ignoresSafeArea()
           
            VStack {
                homeHeader
                HomeStatsView(showPortfolio: $showPortFolio)
                SearchBarView(searchText: $vm.searchText)
                coinTitles
                .padding()
                if !showPortFolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortFolio {
                    portFolioCoinsList
                        .transition(.move(edge: .trailing))

                }
                Spacer(minLength: 0)
            }
           
        }
    }
}

#Preview {
    let dev = DeveloperPreview.instance
    NavigationStack {
        HomeView()
            .navigationBarHidden(true)
    }
    .environmentObject(dev.homeVm)
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
    
    private var allCoinsList : some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumns: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10 ))
            }
          
        }
        .listStyle(.plain)
        
    }
    
    private var portFolioCoinsList : some View {
        List {
            ForEach(vm.portFolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumns: true)
            }
        }
        .listStyle(.plain)
    }
    private var coinTitles : some View {
            HStack {
                Text("Coins")
                Spacer()
                if showPortFolio {
                    Text("Holdings")
                }
                 Text("Prices")
                    .frame(width: UIScreen.main.bounds.width / 3.5 , alignment: .trailing)
        }
            .font(.caption)
            .foregroundStyle(.secondaryText)
            .padding(.horizontal)
    }
}
