//
//  Person.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 12/22/20.
//

import Foundation

struct Person: Codable, Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
}
