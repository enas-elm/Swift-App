//
//  Ingredients.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 23/11/2023.
//

import Foundation

class Ingredients: Identifiable, ObservableObject{
    let id: UUID = UUID()
    
    @Published var ingredientName: String
    @Published var amount: Float
    @Published var ingredientCal: Float
    @Published var ingredientCarbs: Float
    @Published var ingredientProteins: Float
    
    init(ingredientName: String, amount: Float, ingredientCal: Float, ingredientCarbs: Float, ingredientProteins: Float){
        self.ingredientName = ingredientName
        self.amount = amount
        self.ingredientCal = ingredientCal
        self.ingredientCarbs = ingredientCarbs
        self.ingredientProteins = ingredientProteins
    }
}
