//
//  MarketDataService.swift
//  CryptoApp
//
//  Created by Apple on 11/12/25.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData : MarketDataModel? = nil
    var marketDataService : AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url  = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataService =  NetworkManager.download(url: url)
             
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion ,
                receiveValue: ({ [weak self] (receviedGlobalData) in
                self?.marketData = receviedGlobalData.data
                self?.marketDataService?.cancel()
            })
                
    )}
    
}


