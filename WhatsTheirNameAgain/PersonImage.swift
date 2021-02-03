//
//  PersonImage.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 2/2/21.
//

import SwiftUI

struct PersonImage: View {
    var imagePath: String
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
    }
    
    var image: Image {
        let fileName = getDocumentsDirectory().appendingPathComponent(imagePath)
        do {
            let data = try Data.init(contentsOf: fileName)
            let uiImage = UIImage(data: data)
            return Image(uiImage: uiImage!)
        } catch {
            return Image("default-person")
        }
    }
}

struct PersonImage_Previews: PreviewProvider {
    static var previews: some View {
        PersonImage(imagePath: "tom")
    }
}
