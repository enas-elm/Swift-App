//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 21/11/2023.
//

import SwiftUI

struct NewRecepeScreen: View {
    
    @ObservedObject var allRecepes: AllRecepes
    
    @State var imgUrl: String = ""
    @State var name: String = ""
    @State var time: Float = 260
    @State var calories: Float = 20
    
    @State var foods = [Food]()
    @State var query: String = ""
    
    func getNutrition() {
        Api().loadData(query: self.query) { (foods) in
            self.foods = foods
        }
    }
    
    
    var body: some View {
        VStack(spacing: 16) {
            
            AsyncImage(url: URL(string: imgUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray)
            }
            .frame(width: 300, height: 200)


            
            TextField("Image (URL)", text: $imgUrl)
            TextField("Nom", text: $name)
            TextField("Price", value: $calories, format: .number)
                .keyboardType(.numberPad)
            TextField("Time", value: $time, format: .number)
                .keyboardType(.numberPad)


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
                Button("Add") {
                    let myNewRecepe = Recepe(imgUrl: imgUrl, name: name, time: time, calories: food.calories)
                    allRecepes.recepes.append(myNewRecepe)
                }
            }
            
//            Button("Add") {
//                let myNewRecepe = Recepe(imgUrl: imgUrl, name: name, color: color, calories: food.calories))
//                allRecepes.recepes.append(myNewRecepe)
//            }
        }
        .padding()
    }
}

#Preview {
    NewRecepeScreen(allRecepes: AllRecepes(recepes: []))
}
