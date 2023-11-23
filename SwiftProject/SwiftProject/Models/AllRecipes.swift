//
//  AllRecipe.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 23/11/2023.
//

import Foundation


class AllRecipes: ObservableObject {
    @Published var recipes: [Recipe]
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    func removeRecipe(recipe: Recipe) {
        recipes.removeAll { $0.id == recipe.id }
    }
}
