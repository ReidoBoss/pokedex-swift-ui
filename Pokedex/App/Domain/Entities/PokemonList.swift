//
//  PokemonList.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import Foundation

struct PokemonList: Decodable {
    let results: [Data]

    struct Data: Decodable {
        let name: String
        let url: String
    }
}
