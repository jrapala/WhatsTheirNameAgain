//
//  Person.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 12/22/20.
//

import Foundation
import SwiftUI

struct Person: Codable, Comparable {
    var id = UUID()
    let name: String
    let imagePath: String
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.name < rhs.name
    }
}
