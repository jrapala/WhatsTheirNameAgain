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
            List {
                ForEach(people, id: \.id) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        HStack {
                            PersonImage(imagePath: person.imagePath)
                                .frame(width: 100, height: 100)
                            Text(person.name)
                                .font(.headline)
                        }
                    }
                }
                .onDelete(perform: deletePerson)
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
            .onAppear(perform: loadData)
            .sheet(isPresented: $isShowingAddView, content: {
                NameImageView(people: $people)
            })
        }
    }
        
    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("People")
        
        do {
            let data = try Data(contentsOf: filename)
            let decodedData = try JSONDecoder().decode([Person].self, from: data)
            people = decodedData.sorted()
        } catch {
            print("Failed to load data")
        }
    }
    
    func deletePerson(at offsets: IndexSet) {
        people.remove(atOffsets: offsets)
        saveData(people: people)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
