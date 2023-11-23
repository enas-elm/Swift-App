//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 21/11/2023.
//

import SwiftUI
struct NewRecipeScreen: View {
    
    @ObservedObject var allRecipes: AllRecipes
    
    @State var imgUrl: String = ""
    @State var name: String = ""
    @State var time: Float?
    
    @State var ingredients: [Ingredients] = []
    @State var ingredientName = ""
    @State var ingredientAmount: Float = 0.0
    @State var ingredientCal: Float = 0.0
    @State var ingredientCarbs: Float = 0.0
    
    @State var foods = [Food]()
    @State var query: String = ""
    
    func getNutrition() {
        Api().loadData(query: self.query) { (foods) in
            self.foods = foods
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: imgUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: 200)
                    .clipped()
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray)
            }
            .frame(width: .infinity, height: 200)
            
            TextField("Image URL", text: $imgUrl)
            TextField("Recipe name", text: $name)
            TextField("Prep time", value: $time, format: .number)
                .keyboardType(.numberPad)

            
            VStack {
                TextField("Ingredient test", text: $query)
                TextField("Amount", value: $ingredientAmount, format: .number)
                    .keyboardType(.decimalPad)
                Text("")
                Button(action: {
                    getNutrition()
                    guard let food = foods.first else { return }
                    let newIngredients = Ingredients(ingredientName: query, amount: ingredientAmount, ingredientCal: food.calories*ingredientAmount, ingredientCarbs: food.carbohydrates_total_g*ingredientAmount)
                    ingredients.append(newIngredients)
                    ingredientName = ""
                    ingredientAmount = 0.0
                }) {
                    Text("Add Ingredient")
                }
            }
            
            Button(action: {
                let totalCalories = ingredients.reduce(0) { $0 + $1.ingredientCal }
                let totalCarbs = ingredients.reduce(0) { $0 + $1.ingredientCarbs }
                
                let myNewRecipe = Recipe(imgUrl: imgUrl, name: name, time: time!, calories: totalCalories, carbs: totalCarbs, ingredients: ingredients)
                allRecipes.recipes.append(myNewRecipe)
            }) {
                Text("Add the recipe")
            }
            .padding()
        }
        .padding()
    }
}


#Preview {
    NewRecipeScreen(allRecipes: AllRecipes(recipes: []), ingredients: [])
}
