//  Sabah Naveed
//  PostData.swift
//  H4XOR News
//
//  Created by Sabah Naveed on 12/28/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String //look carefully to see what type these properties are in the JSON file
    let points: Int
    let url: String?
    let title: String
}
