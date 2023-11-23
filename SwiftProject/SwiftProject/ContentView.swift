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
            ZStack() {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(myRecipes.recipes) { recipe in
                            NavigationLink {
                                RecipeDetailsView(recipe: recipe, allRecipes: myRecipes)
                            } label: {
                                RecipeCell(recipe: recipe)
                            }
                        }
                    }
                    NavigationLink {
                        NewRecipeScreen(allRecipes: myRecipes, ingredients: [])
                        Image(systemName: "plus.circle.fill")
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 28))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .clipShape(Circle())
                            .shadow(radius: 4)
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
