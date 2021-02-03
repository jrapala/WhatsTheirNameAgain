//
//  ImageSaver.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 2/2/21.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToDisk(image: UIImage, fileName: String) {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        
        // Convert UIImage to Data in order to save
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            do {
                try jpegData.write(to: url, options: [.atomicWrite, .completeFileProtection])
                successHandler?()
            } catch {
                errorHandler?(error)
            }
        }
    }
}
