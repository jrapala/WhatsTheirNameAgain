//
//  Utils.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 2/2/21.
//

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
