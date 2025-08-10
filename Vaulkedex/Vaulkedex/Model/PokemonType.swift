//
//  PokemonType.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/10/25.
//

import Foundation

extension Pokemon {
    struct PokemonType: Decodable {
        let slot: Int
        let type: Data

        struct Data: Decodable {
            let name: String
        }

    }
}
