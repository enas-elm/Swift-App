//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 21/11/2023.
//

import SwiftUI

struct NewClotheScreen: View {
    
    @ObservedObject var closet: Closet
    
    @State var urlString: String = ""
    @State var name: String = ""
    @State var color: Color = .gray
    @State var price: Float = 20
    
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


            
            TextField("Image (URL)", text: $urlString)
            TextField("Marque", text: $name)
            TextField("Prix", value: $price, format: .number)
                .keyboardType(.numberPad)
            ColorPicker("Couleur : ", selection: $color)
            
            Button("Ajouter") {
                let myNewClothe = Clothe(brand: name, color: color, price: price)
                closet.clothes.append(myNewClothe)
            }
        }
        .padding()
    }
}

#Preview {
    NewClotheScreen(closet: Closet(clothes: []))
}
