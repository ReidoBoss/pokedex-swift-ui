//
//  Pokemon.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/10/25.
//

import Foundation

struct Pokemon: Identifiable, Decodable {
    let id: String
    let name: String
    let weight: Int
    let height: Int
    let types: [PokemonType]
    let stats: [PokemonStat]
    let baseExp: Int
    var sprite: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/\(id).svg"
    }

    enum CodingKeys: String, CodingKey {
        case id, name, weight, height, types, stats
        case baseExp = "base_experience"

    }

    // MARK: - For test
    init(
        id: String,
        name: String,
        weight: Int,
        height: Int,
        types: [PokemonType],
        stats: [PokemonStat],
        baseExp: Int,
    ) {
        self.id = id
        self.name = name
        self.weight = weight
        self.height = height
        self.types = types
        self.stats = stats
        self.baseExp = baseExp
    }

}
