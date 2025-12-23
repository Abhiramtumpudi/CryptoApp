//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Apple on 20/12/25.
//

import Foundation
import Combine
import SwiftUI



class CoinImageService  {
    
    @Published var image : UIImage? = nil
    private var imageSubscription : AnyCancellable?
    let coin : CoinModel
    
    init(coin : CoinModel) {
        self.coin = coin
        getImage()
    }
    
    private func getImage() {
        
        guard let url  = URL(string: coin.image) else { return }
        
        imageSubscription =  NetworkManager.download(url: url)
            .tryMap({ (data)-> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion ,
                receiveValue: ({ [weak self] (retunedImage) in
                self?.image = retunedImage
                self?.imageSubscription?.cancel()
            })
        
    )}
}
