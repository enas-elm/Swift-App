//
//  ContentView.swift
//  myApp
//
//  Created by EL MERSHATI Enas on 20/11/2023.
//

import SwiftUI


struct ContentView: View {
    @State var type: String = ""
    
    @State var nom: String = ""
    
    @State var imageUrl : String = "https://images.photowall.com/products/56982/planets-in-space.jpg?h=699&q=85"
    
    let names  = ["Alfred", "Vigny", "Bernard"]
    
    
    
    var body: some View {
        
        VStack {
            List{
                ForEach(names, id: \.self) {name in
                    Text(name)
                    Text("Note :")
                }
            }
            Form {
                Section(header: Text("Les informations")) {
                    TextField("Nom", text: $nom)
                    TextField("Item", text: $type)
                    TextField("Image", text: $imageUrl)
                }
                
                Section {
                    Button(action: {
                        print("Formulaire soumis")
                    }) {
                        Text("Soumettre")
                    }
                }
            }
            
            
            let url = URL(string: imageUrl)
            
            ZStack {
                // Rectangle pour le conteneur personnalisé
   
                AsyncImage(url: url) { image in
                    image
                    
                } placeholder: {
                    Rectangle()
                        .foregroundColor(Color.gray)
                    
                        .overlay(
                            Text("Votre image")
                                .foregroundColor(.white)
                                .font(.title)
                        )
                }
            }
            .frame(width: 200, height: 200)
            .cornerRadius(10)
            .shadow(radius: 5)
        
        }
        .padding()
        
        
   
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
