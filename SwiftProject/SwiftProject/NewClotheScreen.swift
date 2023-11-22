//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 21/11/2023.
//

import SwiftUI

struct NewClotheScreen: View {
    
    @ObservedObject var closet: Closet
    
    @State var urlString: String = ""
    @State var name: String = ""
    @State var color: Color = .gray
    @State var price: Float = 20
    
    @State var foods = [Food]()
    @State var query: String = ""
    
    func getNutrition() {
        Api().loadData(query: self.query) { (foods) in
            self.foods = foods
        }
    }
    
    
    var body: some View {
        VStack(spacing: 16) {
            
            AsyncImage(url: URL(string: urlString)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(color)
            }
            .frame(width: 300, height: 200)


            
            TextField("Image (URL)", text: $urlString)
            TextField("Marque", text: $name)
            TextField("Prix", value: $price, format: .number)
                .keyboardType(.numberPad)
            ColorPicker("Couleur : ", selection: $color)
            
            TextField(
                "Enter some food text",
                text: $query
            )
            Button(action: getNutrition) {
                Text("Get food info")
            }
            Text("[BHJVHJVJHVGHVJGVJHVBHJBHK")
                .padding()
            List(foods) { food in
                Text("\(food.calories) cal")
                Button("Add") {
                    let myNewClothe = Clothe(imgUrl: urlString, brand: name, color: color, price: food.calories)
                    closet.clothes.append(myNewClothe)
                }
            }
            
//            Button("Add") {
//                let myNewClothe = Clothe(imgUrl: urlString, brand: name, color: color, price: food.calories))
//                closet.clothes.append(myNewClothe)
//            }
        }
        .padding()
    }
}

#Preview {
    NewClotheScreen(closet: Closet(clothes: []))
}
