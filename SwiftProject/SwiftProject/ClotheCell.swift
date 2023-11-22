//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 21/11/2023.
//

import SwiftUI
struct ClotheCell: View {
    @ObservedObject var clothe: Clothe
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: clothe.imgUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(clothe.color)
            }
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.4))
            Text(clothe.brand)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .fontWeight(.heavy)
                .padding(16)
        }
        
        .frame(width: 150, height: 150)

    }
}


#Preview {
    ClotheCell(clothe: Clothe.previewCloset[0])
}
