//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import Foundation
import SwiftUI

// MARK: Recepe and AllRecepes Model

class AllRecepes: ObservableObject {
    @Published var recepes: [Recepe]
    
    init(recepes: [Recepe]) {
        self.recepes = recepes
    }
    
    func removeRecepe(recepe: Recepe) {
        recepes.removeAll { $0.id == recepe.id }
     }
}

class Recepe: Identifiable, ObservableObject {
    let id: UUID = UUID()
    
    @Published var name: String
    @Published var imgUrl: String
    @Published var time: Float
    @Published var calories: Float



    
    init(imgUrl: String, name: String, time: Float, calories: Float) {
        self.imgUrl = imgUrl
        self.name = name
        self.time = time
        self.calories = calories
    }
}

// MARK: Preview Data

extension Recepe {
    static let previewAllRecepes: [Recepe] = [
        Recepe(imgUrl:"https://res.cloudinary.com/hv9ssmzrz/image/fetch/c_fill,f_auto,h_387,q_auto,w_650/https://s3-eu-west-1.amazonaws.com/images-ca-1-0-1-eu/tag_photos/original/69867/cuisine_-originale-flickr-50314377611_64ad280b6f_k.jpg" , name: "Cassoulet", time: 200, calories: 110),
        Recepe(imgUrl:"https://images.ricardocuisine.com/services/articles/top-recettes-mars-2022-intro-mobile-1649250827.jpg" , name: "Lait", time: 20, calories: 258),
        Recepe(imgUrl:"https://www.nicolas-aubineau.com/wp-content/uploads/2021/05/recette-gateau-sport-maison.jpg" , name: "Couscous", time: 40, calories: 10)
    ]
    
}
