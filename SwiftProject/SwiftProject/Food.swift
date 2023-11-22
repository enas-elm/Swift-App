import Foundation

struct Food: Codable, Identifiable {
    let id = UUID()
    var name: String
    var calories: Float
    var serving_size_g: Double
    var fat_total_g: Double
    var fat_saturated_g: Double
    var protein_g: Double
    var sodium_mg: Double
    var potassium_mg: Double
    var cholesterol_mg: Double
    var carbohydrates_total_g: Double
    var fiber_g: Double
    var sugar_g: Double
}

class Api : ObservableObject{
    
    @Published var foods = [Food]()
    init() {
    }
    
    func loadData(query: String, completion: @escaping ([Food]) -> ()) {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: "https://api.api-ninjas.com/v1/nutrition?query=\(encodedQuery)")!
        
        var request = URLRequest(url: url)
        request.setValue("KyLCBVZeJ5BwN0YLK+TtXg==hiFepCVWMQWrRJdk", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([Food].self, from: data)
                completion(decodedData) // Appelle la completion avec les données décodées
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
}
