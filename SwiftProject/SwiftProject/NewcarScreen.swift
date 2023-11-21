//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import SwiftUI

struct NewClotheScreen: View {
    
    @ObservedObject var closet: Closet
    
    @State var urlString: String = ""
    @State var name: String = ""
    @State var color: Color = .gray
    
    var body: some View {
        VStack(spacing: 16) {
            
            AsyncImage(url: URL(string: urlString)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(color)
            }
            .frame(width: 300, height: 200)
            .cornerRadius(8)

            
            TextField("Image (URL)", text: $urlString)
            TextField("Marque", text: $name)
            ColorPicker("Couleur : ", selection: $color)
            
            Button("Ajouter") {
                let myNewClothe = Clothe(brand: name, color: color)
                closet.clothes.append(myNewClothe)
            }
        }
        .padding()
    }
}

#Preview {
    NewClotheScreen(closet: Closet(clothes: []))
}
