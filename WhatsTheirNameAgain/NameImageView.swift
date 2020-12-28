//
//  NameImageView.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 12/28/20.
//

import SwiftUI

struct NameImageView: View {
    let image: Image?
    
    var body: some View {
        if image != nil {
            image?
                .resizable()
                .scaledToFit()
        }
    }
}

struct NameImageView_Previews: PreviewProvider {
    static var previews: some View {
        NameImageView(image: Image(systemName: "star"))
    }
}
