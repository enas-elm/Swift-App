//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import Foundation
import SwiftUI

// MARK: Clothe Model

class Closet: ObservableObject {
    @Published var clothes: [Clothe]
    
    init(clothes: [Clothe]) {
        self.clothes = clothes
    }
}

class Clothe: Identifiable, ObservableObject {
    let id: UUID = UUID()
    let brand: String
    @Published var color: Color
    
    init(brand: String, color: Color) {
        self.brand = brand
        self.color = color
    }
}

// MARK: Preview Data

extension Clothe {
    static let previewCloset: [Clothe] = [
        Clothe(brand: "Porsche", color: .red),
        Clothe(brand: "Tesla", color: .white),
        Clothe(brand: "Renault", color: .gray)
    ]
    
}
