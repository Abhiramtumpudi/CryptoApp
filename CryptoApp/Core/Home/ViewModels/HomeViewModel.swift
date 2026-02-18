//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Apple on 03/12/25.
//

import Foundation
import Combine


class HomeViewModel : ObservableObject {
    
    @Published var  statistics : [StatsModel] = []
    
    @Published var allCoins : [CoinModel] = []
    @Published var portFolioCoins : [CoinModel] = []
    @Published var searchText : String = ""
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    

    
    init() {
      
        addSubscribers()
        
    }
    
    func addSubscribers() {
        
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5)  , scheduler: DispatchQueue.main)
            .map(filteredCoins)
            .sink { [weak self](recievedCoins) in
                self?.allCoins = recievedCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
           
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
    }
    
    private func filteredCoins(text: String , coins : [CoinModel])-> [CoinModel] {
        guard !text.isEmpty else{
            return coins
        }
        
        let lowerCasedtext = text.lowercased()
        return coins.filter{ (coin)-> Bool in
            return coin.name.contains(lowerCasedtext) ||
                   coin.symbol.contains(lowerCasedtext) ||
                   coin.id.contains(lowerCasedtext)
        }
    }
    
    
    
    private func mapGlobalMarketData(_ marketDataModel : MarketDataModel?)-> [StatsModel] {
        
        var stats : [StatsModel] = []
        
        guard let data = marketDataModel else { return stats }
        
        let marketCap = StatsModel(title: "Market Cap", value: data.marketCap , percentageChange: data.marketCapChangePercentage24HUsd)
        
        let volume = StatsModel(title: "24h Volume", value: data.volume)
        
        let btcDominance = StatsModel(title: "BTC Dominance", value: data.bitCoinDominanace)
        
        let portFolio = StatsModel(title: "Portfolio", value: "$0.0", percentageChange: 0)
        
        stats.append(contentsOf:
               [marketCap , volume , btcDominance, portFolio]
        )
        return stats
    }
    
}
