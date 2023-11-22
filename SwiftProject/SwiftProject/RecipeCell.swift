//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 21/11/2023.
//

import SwiftUI
struct RecipeCell: View {
    @ObservedObject var recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: recipe.imgUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray)
            }
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.4))
            Text(recipe.name)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .fontWeight(.heavy)
                .padding(16)
        }
        
        .frame(width: 150, height: 150)

    }
}


#Preview {
    RecipeCell(recipe: Recipe.previewAllRecipes[0])
}
