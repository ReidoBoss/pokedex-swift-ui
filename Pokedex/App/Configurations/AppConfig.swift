//
//  AppConfig.swift
//  Pokedex
//
//  Created by Stephen T. Sagarino Jr. on 8/12/25.
//

import Foundation

final class AppConfig {
    static let shared = AppConfig()

    let pokeApiBaseUrl: String?

    init() {
        self.pokeApiBaseUrl =
            Bundle.main.object(forInfoDictionaryKey: "POKE_API_BASE_URL")
            as? String
    }
}
