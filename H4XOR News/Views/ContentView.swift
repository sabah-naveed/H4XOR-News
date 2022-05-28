//  Sabah Naveed
//  ContentView.swift
//  H4XOR News
//
//  Created by Sabah Naveed on 12/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) { //like a segue but having to do with links
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                }
                
                    
                }
            }
            .navigationBarTitle("H4XOR News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//let posts = [
//    Post(id: 1, title: "hello"),
//    Post(id: 2, title: "bonjour"),
//    Post(id: 3, title: "salam"),
//    Post(id: 4, title: "hola")
//]
