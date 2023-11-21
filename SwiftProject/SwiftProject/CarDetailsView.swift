//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import SwiftUI

struct ClotheDetailsView: View {
    
    @ObservedObject var clothe: Clothe
    
    var body: some View {
        VStack {
            Text(clothe.brand)
            ColorPicker("Couleur : ", selection: $clothe.color)
        }
        .padding()
    }
}

#Preview {
    ClotheDetailsView(clothe: Clothe.previewCloset[0])
}
