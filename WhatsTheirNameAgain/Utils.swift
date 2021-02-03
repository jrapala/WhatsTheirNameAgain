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

func saveData(people: [Person]) {
    let filename = getDocumentsDirectory().appendingPathComponent("People")

    do {
        let data = try JSONEncoder().encode(people)
        try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
    } catch {
        print("Unable to save data")
    }
}
