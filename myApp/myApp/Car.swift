//
//  Car.swift
//  myApp
//
//  Created by EL MERSHATI Enas on 20/11/2023.
//

import Foundation

import SwiftUI

// MARK: Car model
struct Car: Identifiable{
    let id: UUID = UUID()
    let brand: String
    let color: Color
}
extension Car {
    let previewGarage: [Car] = [
        Car(brand: "Rerrari", color: .red),
        Car(brand: "Marcedes", color: .blue)
    ]
}
