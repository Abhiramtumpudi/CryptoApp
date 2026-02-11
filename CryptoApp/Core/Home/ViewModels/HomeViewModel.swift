//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Apple on 03/12/25.
//

import Foundation
import Combine


class HomeViewModel : ObservableObject {
    
    @Published var  statistics : [StaticViewModel] = [
        StaticViewModel(title: "Market Cap", value: "Val", percentageChange: 23.4),
        StaticViewModel(title: "Market Cap", value: "Val"),
        StaticViewModel(title: "Market Cap", value: "Val"),
        StaticViewModel(title: "Market Cap", value: "Val", percentageChange: -7)
    ]
    
    @Published var allCoins : [CoinModel] = []
    @Published var portFolioCoins : [CoinModel] = []
    @Published var searchText : String = ""
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    

    
    init() {
      
        addSubscribers()
        
    }
    
    func addSubscribers() {
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5)  , scheduler: DispatchQueue.main)
            .map(filteredCoins)
            .sink { [weak self](recievedCoins) in
                self?.allCoins = recievedCoins
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
    
}
