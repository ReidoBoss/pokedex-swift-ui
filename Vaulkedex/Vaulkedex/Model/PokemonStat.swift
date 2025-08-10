//
//  PokemonStat.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/10/25.
//

extension Pokemon {
    struct PokemonStat: Decodable {
        let base: Int
        let stat: Data

        enum CodingKeys: String, CodingKey {
            case base = "base_stat"
            case stat
        }

        struct Data: Decodable {
            let name: String
            let stat: StatName

            enum StatName: String, Decodable {
                case hp, attack, defense, speed
            }
        }

    }
}
