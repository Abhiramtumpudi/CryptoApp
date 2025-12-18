//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Apple on 03/12/25.
//

import Foundation
import Combine


class HomeViewModel : ObservableObject {
    
    @Published var allCoins : [CoinModel] = []
    @Published var portFolioCoins : [CoinModel] = []
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    

    
    init() {
      
        addSubscribers()
        
    }
    
    func addSubscribers() {
        
        dataService.$allCoins
            .sink { (recievedCoins) in
                self.allCoins = recievedCoins
            }
            .store(in: &cancellables)

    }
    
}
