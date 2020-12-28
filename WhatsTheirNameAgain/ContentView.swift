//
//  ContentView.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 12/22/20.
//

import SwiftUI

struct ContentView: View {
    let people = [Person]()

    var body: some View {
        NavigationView {
            List(people, id: \.id) { person in
                HStack {
                    VStack(alignment: .leading) {
                        if person.image != nil {
                            person.image?
                                .resizable()
                                .scaledToFit()
                        }
                        Text(person.name)
                    }
                }
            }
            .navigationBarTitle("What's Their Name?")
            .navigationBarItems(trailing: NavigationLink(destination: NameImageView(people: people)) {
                Image(systemName: "plus")
            })
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
