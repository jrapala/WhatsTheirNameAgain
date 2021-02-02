//
//  ContentView.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 12/22/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAddView = false
    @State private var people = [Person]()

    var body: some View {
        NavigationView {
            List(people, id: \.id) { person in
                NavigationLink(destination: DetailView(person: person)) {
                    HStack {
                        if person.image != nil {
                            person.image?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }

                        Text(person.name)
                            .font(.headline)
                    }
                }
            }
            .navigationBarTitle("My Memory Bank")
            .navigationBarItems(trailing: Button(action: {
                self.isShowingAddView.toggle()
            }) {
                HStack {
                    Image(systemName: "plus")
                    Text("Add")
                    
                }
            })
            .sheet(isPresented: $isShowingAddView, content: {
                NameImageView(people: $people)
            })
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
