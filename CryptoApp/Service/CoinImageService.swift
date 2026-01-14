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
    private let coin : CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName : String
    
    init(coin : CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Retrived imnages from fileManager")
        } else {
            downloadImage()
            print("Download images now")
        }
    }
    
    private func downloadImage() {
        
        guard let url  = URL(string: coin.image) else { return }
        
        imageSubscription =  NetworkManager.download(url: url)
            .tryMap({ (data)-> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion ,
                receiveValue:  { [weak self] (retunedImage) in
                guard let self = self , let downloadImage = retunedImage else {return}
                self.image = retunedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadImage, imageName: self.imageName , folderName: self.folderName)
            })
    }
}
