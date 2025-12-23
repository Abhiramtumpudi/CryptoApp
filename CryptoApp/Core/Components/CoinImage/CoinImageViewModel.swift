//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Apple on 20/12/25.
//

import Foundation
import SwiftUI
import Combine


class CoinImageViewModel : ObservableObject {
    
    @Published var image : UIImage?
    @Published var isLoading = false
    
    
    private var coin: CoinModel
    private var dataService : CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    
    init(coin : CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
    }
    
   private  func addSubscribers() {
        
       dataService.$image
           .sink {[weak self] (_) in
               self?.isLoading = false
           } receiveValue: { [weak self] (returnedImage) in
               self?.image = returnedImage
           }
           .store(in: &cancellables)
        
    }
    
}
