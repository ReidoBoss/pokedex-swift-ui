//
//  PokemonStat.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/10/25.
//

import SwiftUI

extension Pokemon {
    struct PokemonStat: Decodable, Identifiable {
        let base: Int
        let stat: Data

        var id: String {
            stat.name.rawValue
        }

        enum CodingKeys: String, CodingKey {
            case base = "base_stat"
            case stat
        }

        struct Data: Decodable {
            let name: StatName

            var color: Color {
                switch name {
                case .hp: Color(.systemRed)
                case .attack: Color(.systemYellow)
                case .defense: Color(.systemCyan)
                case .speed: Color(.systemTeal)
                }
            }

            enum StatName: String, Decodable {
                case hp
                case attack = "atk"
                case defense = "def"
                case speed = "spd"
            }
        }

    }
}
