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
        }
    }

}
