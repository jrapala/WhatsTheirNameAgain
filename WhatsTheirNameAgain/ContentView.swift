//
//  ContentView.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 12/22/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showingImagePicker = false
    @State private var showingNameImageView = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
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
            .navigationBarItems(trailing: Button(action: {
                self.showingImagePicker.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        self.showingNameImageView.toggle()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
