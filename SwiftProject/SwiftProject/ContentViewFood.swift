//
//  ContentViewFood.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 22/11/2023.
//

import SwiftUI

struct ContentViewFood: View {
    
    @State var foods = [Food]()
    @State var query: String = ""
    
    func getNutrition() {
        Api().loadData(query: self.query) { (foods) in
            self.foods = foods
        }
    }
    
    var body: some View {
        VStack{
            TextField(
                "Enter some food text",
                text: $query
            )
            Button(action: getNutrition) {
                Text("Get food info")
            }
                .padding()
            List(foods) { food in
                Text("\(food.calories) cal")
            }
        }
        
        
    }
}

struct ContentViewfood_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewFood()
    }
}
