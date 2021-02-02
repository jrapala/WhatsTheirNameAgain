//
//  DetailView.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 2/2/21.
//

import SwiftUI

struct DetailView: View {
    var person: Person
    
    var body: some View {
        VStack {
            Text(person.name)
                .font(.title)
            
            VStack {
                person.image?
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 400, alignment: .center)
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person(name: "Tom Hanks", image: Image("tom")))
    }
}
