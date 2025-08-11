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

            var title: String {
                switch name {
                case .hp: "HP"
                case .attack: "ATK"
                case .specialAttack: "S-ATK"
                case .specialDef: "S-DEF"
                case .defense: "DEF"
                case .speed: "SPD"
                }
            }

            var color: Color {
                switch name {
                case .hp: Color(.systemRed)
                case .attack: Color(.systemYellow)
                case .defense: Color(.systemCyan)
                case .speed: Color(.systemTeal)
                case .specialAttack: Color(.systemBrown)
                case .specialDef: Color(.systemBlue)
                }
            }

            enum StatName: String, Decodable {
                case hp
                case attack /*= "atk"*/
                case specialAttack = "special-attack"
                case specialDef = "special-defense"
                case defense /*= "def"*/
                case speed /*= "spd"*/
            }
        }

    }
}
