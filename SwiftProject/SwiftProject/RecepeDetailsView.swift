//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 21/11/2023.
//

import SwiftUI

struct RecepeDetailsView: View {
    
    @ObservedObject var recepe: Recepe
    @ObservedObject var allRecepes: AllRecepes
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recepe.imgUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(Color.gray)
            }
            .frame(width: 300, height: 200)

            TextField("Image (URL)", text: $recepe.imgUrl)
            TextField("Nom", text: $recepe.name)
            TextField("Time", value: $recepe.time, format: .number)
                .keyboardType(.numberPad)
            TextField("Calories", value: $recepe.calories, format: .number)
                .keyboardType(.numberPad)
        }
        .padding()

        
        Button(action: {
            allRecepes.removeRecepe(recepe: recepe)
        }, label: {
            Image(systemName: "xmark.bin")
                .foregroundColor(.red)
        })
        
    }
}

#Preview {
    RecepeDetailsView(recepe: Recepe.previewAllRecepes[0], allRecepes: AllRecepes(recepes: Recepe.previewAllRecepes))
}
