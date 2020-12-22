//
//  ContentView.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 12/22/20.
//

import SwiftUI

struct ContentView: View {
    let people = [
        Person(name: "Judy", imageName: "judy.jpg"),
        Person(name: "Eric", imageName: "eric.jpg"),
        Person(name: "Barbara", imageName: "barbara.jpg"),
        Person(name: "Naomi", imageName: "naomi.jpg"),
    ]

    var body: some View {
        NavigationView {
            List(people, id: \.id) { person in
                HStack {
                    VStack(alignment: .leading) {
                        Text(person.name)
                    }
                }
            }
            .navigationBarTitle("What's Their Name?")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
