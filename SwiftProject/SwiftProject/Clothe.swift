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
    
    func removeClothe(_ clothe: Clothe) {
         if let index = clothes.firstIndex(where: { $0.id == clothe.id }) {
             clothes.remove(at: index)
         }
     }
}

class Clothe: Identifiable, ObservableObject {
    let id: UUID = UUID()
    
    @Published var brand: String
    @Published var imgUrl: String
    @Published var price: Float
    @Published var color: Color
    

    
    init(imgUrl: String, brand: String, color: Color, price: Float) {
        self.imgUrl = imgUrl
        self.brand = brand
        self.color = color
        self.price = price
    }
}

// MARK: Preview Data

extension Clothe {
    static let previewCloset: [Clothe] = [
        Clothe(imgUrl:"https://i.pinimg.com/564x/b7/02/3b/b7023b2a9f732920d8ad12f3f59d51a6.jpg" , brand: "Nike", color: .green, price: 110),
        Clothe(imgUrl:"https://i.pinimg.com/564x/e8/f2/d2/e8f2d279a7f1651a40bf8cc6260905d1.jpg" , brand: "Maje", color: .blue, price: 258),
        Clothe(imgUrl:"https://i.pinimg.com/564x/b2/ba/c1/b2bac1e5ababfd6afe4ee68c02b990e9.jpg" , brand: "Adidas", color: .brown, price: 10)
    ]
    
}
