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
    let baseExp: Int
    //    let sprites: String

    enum CodingKeys: String, CodingKey {
        case id, name, weight, height, types
        case baseExp = "base_experience"
    }

    enum SpriteKeys: String, CodingKey {
        case other
    }

    enum OtherKeys: String, CodingKey {
        case dreamworld
    }

    enum DreamworldKeys: String, CodingKey {
        case frontDefault = "front_default"
    }

    struct PokemonType: Decodable {
        let slot: Int
        let type: Data

        struct Data: Decodable {
            let name: String
        }
    }

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
