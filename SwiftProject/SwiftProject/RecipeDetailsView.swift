//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 21/11/2023.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    @ObservedObject var recipe: Recipe
    @ObservedObject var allRecipes: AllRecipes
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.imgUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(Color.gray)
            }
            .frame(width: 300, height: 200)

            TextField("Image (URL)", text: $recipe.imgUrl)
            TextField("Nom", text: $recipe.name)
            TextField("Time", value: $recipe.time, format: .number)
                .keyboardType(.numberPad)
            TextField("Calories", value: $recipe.calories, format: .number)
                .keyboardType(.numberPad)
        }
        .padding()

        
        Button(action: {
            allRecipes.removeRecipe(recipe: recipe)
        }, label: {
            Image(systemName: "xmark.bin")
                .foregroundColor(.red)
        })
        
    }
}

#Preview {
    RecipeDetailsView(recipe: Recipe.previewAllRecipes[0], allRecipes: AllRecipes(recipes: Recipe.previewAllRecipes))
}
