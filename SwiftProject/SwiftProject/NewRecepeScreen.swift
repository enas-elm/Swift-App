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
    @State var ingredientAmount: Float = 100
    @State var ingredientCal: Float = 0
    @State var ingredientCarbs: Float = 0
    
    @State var foods = [Food]()
    @State var query: String = ""
    
    func getNutrition() {
        Api().loadData(query: self.query) { (foods) in
            DispatchQueue.main.async {
                self.foods = foods
                
                // Vérifie si les données sont disponibles avant d'ajouter un ingrédient
                if let food = self.foods.first {
                    let newIngredients = Ingredients(ingredientName: self.query, amount: self.ingredientAmount, ingredientCal: (food.calories * self.ingredientAmount) / 100, ingredientCarbs: (food.carbohydrates_total_g * self.ingredientAmount) / 100)
                    self.ingredients.append(newIngredients)
                    self.query = ""
                    self.ingredientAmount = 100
                } else {
                    // Gérer le cas où les données de food ne sont pas disponibles
                    // Vous pouvez afficher un message d'erreur ou prendre une autre action ici
                    print("No food data available")
                }
            }
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
            TextField("Preparation time (minutes)", value: $time, format: .number)
                .keyboardType(.numberPad)

            
             VStack(alignment: .leading) {
                ForEach(ingredients.indices, id: \.self) { index in
                     HStack {
                         Text("•")
                         Text( String(format: "%.1fg", ingredients[index].amount, "g"))
                         Text(ingredients[index].ingredientName)
                     }
                 }
                
                 HStack{
                     TextField("Ingredient", text: $query)
                     HStack{
                         TextField("Amount", value: $ingredientAmount, format: .number)
                             .keyboardType(.decimalPad)
                         Text("g")
                     }
                 }
                Button(action: {
                    getNutrition()
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
