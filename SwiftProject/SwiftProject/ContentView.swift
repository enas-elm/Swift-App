//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var newRecipeScreenIsPresented = false
    
    @StateObject var myRecipes = AllRecipes(recipes: Recipe.previewAllRecipes)
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(myRecipes.recipes) { recipe in
                            NavigationLink {
                                RecipeDetailsView(recipe: recipe, allRecipes: myRecipes)
                            } label: {
                                RecipeCell(recipe: recipe)
                            }
                            Divider()
                                .padding()
                        }
                    }
                    NavigationLink {
                        NewRecipeScreen(allRecipes: myRecipes)
                    } label: {
                       Text("New")
                    }
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    ContentView(myRecipes: AllRecipes(recipes: Recipe.previewAllRecipes))
}
