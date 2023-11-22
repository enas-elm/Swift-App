//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 21/11/2023.
//

import SwiftUI

struct ClotheDetailsView: View {
    
    @ObservedObject var clothe: Clothe
    @ObservedObject var closet: Closet
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: clothe.imgUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(Color.gray)
            }
            .frame(width: 300, height: 200)

            TextField("Image (URL)", text: $clothe.imgUrl)
            TextField("Brand", text: $clothe.brand)
            TextField("Prix", value: $clothe.price, format: .number)
                .keyboardType(.numberPad)
            ColorPicker("Color : ", selection: $clothe.color)
        }
        .padding()

        
        Button(action: {
            closet.removeClothe(clothe)
        }, label: {
            Image(systemName: "xmark.bin")
                .foregroundColor(.red)
        })
        
    }
}

#Preview {
    ClotheDetailsView(clothe: Clothe.previewCloset[0], closet: Closet(clothes: Clothe.previewCloset))
}
