//
//  JokesController.swift
//  Jokes
//
//  Created by Don Bouncy on 19/02/2023.
//

import Foundation

class JokesController: ObservableObject{
    @Published var joke: Jokes?
    @Published var isLoading = false
    @Published var showPunchline = false
    
    func fetchJoke() async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.showPunchline = false
        }
        
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else {
            print("Couldn't connect")
            return
        }
        
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            let res = response as! HTTPURLResponse
            
            if res.statusCode == 200 {
                if let decodedData = try? JSONDecoder().decode(Jokes.self, from: data){
                    joke = decodedData
                }
            }
            DispatchQueue.main.async {
                self.isLoading = false
            }
        } catch {
            print("Couldn't decode data")
        }
        
    }
}
