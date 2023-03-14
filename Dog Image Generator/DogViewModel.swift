//
//  DogViewModel.swift
//  Dog Image Generator
//
//  Created by Preetam Beeravelli on 3/13/23.
//

import Foundation
class DogViewModel: ObservableObject{
    @Published var url: URL?
    
    func fetchURL(){
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else {return}
            do{
                let decodedData = try JSONDecoder().decode(DogModel.self, from: data)
                DispatchQueue.main.async {
                    self.url = URL(string: decodedData.message)
                }
            }catch{
                print("Error Decoding data")
            }
        }
        task.resume()
    }
}
