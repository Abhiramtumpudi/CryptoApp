//
//  LocalFileManager.swift
//  CryptoApp
//
//  Created by Apple on 26/12/25.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
    func saveImage(image : UIImage , imageName : String , folderName : String) {
        
        // create folder for
        createFolderUrl(folderName: folderName)
        
        
        // get path for image
        guard let data = image.pngData(),
              
              let url = getUrlForImage(imageName: imageName, folderName: folderName) else { return }
        
        // save image to path
        do {
            
            try data.write(to: url)
            
        } catch let error  {
            
            print("Error saving image \(error.localizedDescription)")
            
        }
        
    }
    
    func getImage(imageName : String , folderName : String)-> UIImage? {
        
        guard let url = getUrlForImage(imageName: imageName, folderName: folderName),
              
        FileManager.default.fileExists(atPath: url.path)
                
        else {
            
            return nil
            
        }
        
        return UIImage(contentsOfFile: url.path)
        
    }
    
    
    private func createFolderUrl(folderName : String) {
        
        guard let url = getUrlForFolder(foldername: folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true , attributes: nil)
            } catch let error {
                print("Error creating directory , Folder : \(folderName). \(error)")
            }
        }
    }
    
    private func getUrlForFolder(foldername : String)-> URL? {
        
       guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
    
        return url.appendingPathComponent(foldername)
        
    }
    
    private func getUrlForImage(imageName : String , folderName : String)-> URL? {
        
        guard let folderURL = getUrlForFolder(foldername: folderName) else {return nil}
        
        return folderURL.appendingPathComponent(imageName + ".png")

        
    }
    
}
