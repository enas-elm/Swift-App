//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import Foundation
import SwiftUI

// MARK: Recipe and AllRecipes Model

class AllRecipes: ObservableObject {
    @Published var recipes: [Recipe]
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    func removeRecipe(recipe: Recipe) {
        recipes.removeAll { $0.id == recipe.id }
    }
}

class Recipe: Identifiable, ObservableObject {
    let id: UUID = UUID()
    
    @Published var name: String
    @Published var imgUrl: String
    @Published var time: Float
    @Published var calories: Float
    @Published var carbs: Float
    
    @Published var ingredients: [Ingredients]
    
    init(imgUrl: String, name: String, time: Float, calories: Float, carbs: Float, ingredients: [Ingredients]) {
        self.imgUrl = imgUrl
        self.name = name
        self.time = time
        self.calories = calories
        self.carbs = carbs
        self.ingredients = ingredients
    }
}

class Ingredients: Identifiable, ObservableObject{
    let id: UUID = UUID()
    
    @Published var ingredientName: String
    @Published var amount: Float
    @Published var ingredientCal: Float
    @Published var ingredientCarbs: Float
    
    init(ingredientName: String, amount: Float, ingredientCal: Float, ingredientCarbs: Float){
        self.ingredientName = ingredientName
        self.amount = amount
        self.ingredientCal = ingredientCal
        self.ingredientCarbs = ingredientCarbs
    }
    
}

// MARK: Preview Data

extension Recipe {
    static let previewAllRecipes: [Recipe] = [
        Recipe(imgUrl:"https://cache.marieclaire.fr/data/photo/w1000_ci/6g/lasagnes-aux-3-viandes-pate-maison.jpg" , name: "Lasagne", time: 20, calories: 258, carbs: 20, ingredients: [
            Ingredients(ingredientName: "Tomato", amount: 100, ingredientCal: 18.2, ingredientCarbs: 3.9),
            Ingredients(ingredientName: "Onion", amount: 100, ingredientCal: 44.7, ingredientCarbs: 10.1)
        ]),
        Recipe(imgUrl:"https://images.radio-canada.ca/v1/alimentation/recette/4x3/2868-couscous-repas-legumes-abricots.jpg" , name: "Couscous", time: 40, calories: 10, carbs: 20, ingredients: [
            Ingredients(ingredientName: "Tomato", amount: 100, ingredientCal: 18.2, ingredientCarbs: 3.9),
            Ingredients(ingredientName: "Semolina", amount: 100, ingredientCal: 360, ingredientCarbs: 73.9),
            Ingredients(ingredientName: "Onion", amount: 100, ingredientCal: 44.7, ingredientCarbs: 10.1)
        ])
    ]
    
}
