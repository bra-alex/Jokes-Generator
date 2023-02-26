//
//  JokesModel.swift
//  Jokes
//
//  Created by Don Bouncy on 19/02/2023.
//

import Foundation

struct Jokes: Codable{
    let id: Int;
    let type: String;
    let setup: String;
    let punchline: String
}
