//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import Foundation
import SwiftUI

// MARK: Clothe and Closet Model

class Closet: ObservableObject {
    @Published var clothes: [Clothe]
    
    init(clothes: [Clothe]) {
        self.clothes = clothes
    }
}

class Clothe: Identifiable, ObservableObject {
    let id: UUID = UUID()
    let brand: String
    @Published var price: Float
    @Published var color: Color
    
    init(brand: String, color: Color, price: Float) {
        self.brand = brand
        self.color = color
        self.price = price
    }
}

// MARK: Preview Data

extension Clothe {
    static let previewCloset: [Clothe] = [
        Clothe(brand: "Louboutin", color: .red, price: 3000),
        Clothe(brand: "Maje", color: .blue, price: 123),
        Clothe(brand: "Mango", color: .brown, price: 10)
    ]
    
}
