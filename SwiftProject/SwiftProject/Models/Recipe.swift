//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import Foundation

// MARK: Recipe and AllRecipes Model

class Recipe: Identifiable, ObservableObject {
    let id: UUID = UUID()
    
    @Published var name: String
    @Published var imgUrl: String
    @Published var time: Float
    @Published var calories: Float
    @Published var carbs: Float
    @Published var proteins: Float
    
    @Published var ingredients: [Ingredients]
    
    init(imgUrl: String, name: String, time: Float, calories: Float, carbs: Float, proteins:Float, ingredients: [Ingredients]) {
        self.imgUrl = imgUrl
        self.name = name
        self.time = time
        self.calories = calories
        self.carbs = carbs
        self.proteins = proteins
        self.ingredients = ingredients
    }
}

// MARK: Preview Data

extension Recipe {
    static let previewAllRecipes: [Recipe] = [
        Recipe(imgUrl:"https://cache.marieclaire.fr/data/photo/w1000_ci/6g/lasagnes-aux-3-viandes-pate-maison.jpg" , name: "Lasagne", time: 20, calories: 40.5, carbs: 8.9, proteins: 1.6, ingredients: [
            Ingredients(ingredientName: "Tomato", amount: 100, ingredientCal: 18.2, ingredientCarbs: 3.9, ingredientProteins: 0.9),
            Ingredients(ingredientName: "Onion", amount: 50, ingredientCal: 22.3, ingredientCarbs: 5, ingredientProteins: 0.7)
        ]),
        Recipe(imgUrl:"https://images.radio-canada.ca/v1/alimentation/recette/4x3/2868-couscous-repas-legumes-abricots.jpg" , name: "Couscous", time: 40, calories: 10, carbs: 20, proteins:14.7, ingredients: [
            Ingredients(ingredientName: "Tomato", amount: 100, ingredientCal: 18.2, ingredientCarbs: 3.9, ingredientProteins: 0.9),
            Ingredients(ingredientName: "Semolina", amount: 100, ingredientCal: 360, ingredientCarbs: 73.9, ingredientProteins: 12.7),
            Ingredients(ingredientName: "Onion", amount: 100, ingredientCal: 44.7, ingredientCarbs: 10.1, ingredientProteins: 1.4)
        ])
    ]
    
}
