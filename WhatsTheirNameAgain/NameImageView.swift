//
//  NameImageView.swift
//  WhatsTheirNameAgain
//
//  Created by Juliette Rapala on 12/28/20.
//

import SwiftUI

struct NameImageView: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State private var name = ""
    @Binding var people: [Person]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Add New Person")
                .font(.title2)
            
            VStack {
                if image != nil {
                    image?
                        .resizable()
                        .scaledToFit()
                        .padding()
                } else {
                    Button("Choose an Image") {
                        self.showingImagePicker.toggle()
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 400, alignment: .center)
            .padding()
            
            TextField("Name of person", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                savePerson()
            }
            .padding()
            .disabled(name.count == 0 || image == nil)

        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
        
    func savePerson() {
        guard let inputImage = inputImage else { return }
        
        let imageSaver = ImageSaver()
        let fileName = UUID().uuidString

        imageSaver.successHandler = {
            let newPerson = Person(name: name, imagePath: fileName)
            // Insert at correct location
            if let index = people.firstIndex(where: { $0 > newPerson }) {
                people.insert(newPerson, at: index)
            }
            
            saveData(people: people)
        }
        
        imageSaver.errorHandler = {
            print("Oops: \($0.localizedDescription)")
        }
        
        imageSaver.writeToDisk(image: inputImage, fileName: fileName)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct NameImageView_Previews: PreviewProvider {
    static var previews: some View {
        let people = [
            Person(name: "Tom Hanks", imagePath: "tom")
        ]
        return NameImageView(people: .constant(people))
    }
}
