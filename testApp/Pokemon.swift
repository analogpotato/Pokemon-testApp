//
//  Model.swift
//  testApp
//
//  Created by Frank on 6/27/21.
//

import Foundation

struct Pokemons: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String
}
