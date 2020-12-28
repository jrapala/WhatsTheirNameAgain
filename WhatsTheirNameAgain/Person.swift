//
//  Person.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 12/22/20.
//

import Foundation
import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    let name: String
    let image: Image?
}
