//  Sabah Naveed
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Sabah Naveed on 12/28/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]() //published -> whenever there are changes notify the listeners or observed objects
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil { //make sure theres no errros
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do { //because the decoder can throw exceptions
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume() //starts off networking task
        }
    }
}
