//
//  PokemonType.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/10/25.
//

import Foundation
import SwiftUI

extension Pokemon {
    struct PokemonType: Decodable, Identifiable {
        var id: String {
            type.name.rawValue
        }
        let slot: Int
        let type: Data

        struct Data: Decodable {
            let name: Name
        }

        enum Name: String, Decodable {
            case normal
            case fire
            case water
            case electric
            case grass
            case ice
            case fighting
            case poison
            case ground
            case flying
            case psychic
            case bug
            case rock
            case ghost
            case dragon
            case dark
            case steel
            case fairy

            var color: Color {
                switch self {
                case .normal: return Color.gray
                case .fire: return Color.red
                case .water: return Color.blue
                case .electric: return Color.yellow
                case .grass: return Color.green
                case .ice: return Color.cyan
                case .fighting: return Color.orange
                case .poison: return Color.purple
                case .ground: return Color.brown
                case .flying: return Color.indigo
                case .psychic: return Color.pink
                case .bug: return Color.teal
                case .rock: return Color(white: 0.4)
                case .ghost:
                    return Color(hue: 0.7, saturation: 0.5, brightness: 0.5)
                case .dragon:
                    return Color(hue: 0.6, saturation: 0.8, brightness: 0.8)
                case .dark: return Color.black
                case .steel: return Color(white: 0.7)
                case .fairy:
                    return Color(hue: 0.9, saturation: 0.5, brightness: 1.0)
                }
            }
        }
    }

}
