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
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                VStack (spacing: 2){
                    ZStack(alignment: .bottomLeading) {
                        
                        AsyncImage(url: URL(string: recipe.imgUrl)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: .infinity, height: 200)
                                .clipped()
                        } placeholder: {
                            Rectangle()
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: .infinity, height: 200)
                    LabeledContent("Image URL :") {
                        TextField("Image URL", text: $recipe.imgUrl)
                    }
                }
                
                HStack{
                    Button(action: {
                        allRecipes.removeRecipe(recipe: recipe)
                    }, label: {
                        Image(systemName: "xmark.bin.fill")
                            .foregroundColor(.red)
                    })
                    TextField("Nom", text: $recipe.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                }
                
                VStack(alignment: .leading, spacing: 8){
                    HStack{
                        Image(systemName: "flame")
                            .foregroundColor(.orange)
                        Text("Calories : " + String(format: "%.1f g", recipe.calories))
                            .foregroundStyle(.orange)
                            .fontWeight(.semibold)
                    }
                    HStack{
                        Image(systemName: "cube.box")
                            .foregroundColor(.pink)
                        Text("Carbs : " + String(format: "%.1f g", recipe.carbs))
                            .foregroundStyle(.pink)
                            .fontWeight(.semibold)
                    }
                    HStack{
                        Image(systemName: "dumbbell")
                            .foregroundColor(.blue)
                        Text("Proteins : " + String(format: "%.1f g", recipe.proteins))
                            .foregroundStyle(.blue)
                            .fontWeight(.semibold)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Preparation time (minutes)")
                        .font(.headline)
                    HStack{
                        TextField("Time", value: $recipe.time, format: .number)
                            .keyboardType(.numberPad)
                        Text("minutes")
                    }
                    
                }
                
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                    ForEach(recipe.ingredients) { ingredient in
                        HStack {
                            Text("•")
                            Text( String(format: "%.1f g", ingredient.amount))
                            Text(ingredient.ingredientName)
                            
                            HStack(spacing:10){
                                HStack(spacing: 4){
                                    Image(systemName: "flame")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.orange)
                                    Text( String(format: "%.1fg", ingredient.ingredientCal))
                                        .foregroundStyle(.orange)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 12))
                                }
                                
                                HStack(spacing: 4){
                                    Image(systemName: "cube.box")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.pink)
                                    Text( String(format: "%.1fg", ingredient.ingredientCarbs))
                                        .foregroundStyle(.pink)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 12))
                                }
                                HStack(spacing: 4){
                                    Image(systemName: "dumbbell")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.blue)
                                    Text( String(format: "%.1fg", ingredient.ingredientProteins))
                                        .foregroundStyle(.blue)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 12))
                                }
                            }
                        }
                    }
                    
                }
                
                
                
            }
            .padding()
            
        }
    }
}

#Preview {
    RecipeDetailsView(recipe: Recipe.previewAllRecipes[0], allRecipes: AllRecipes(recipes: Recipe.previewAllRecipes))
}
