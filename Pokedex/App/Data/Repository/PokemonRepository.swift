//
//  PokemonRepository.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import Combine
import Foundation

protocol PokemonRepository {
    func get() -> AnyPublisher<[Pokemon], Error>
    func find(pokemon: String) -> AnyPublisher<Pokemon, Error>
}

struct PokemonRepositoryImpl: PokemonRepository {

    private let pokemonService: PokemonService

    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
    }

    func get() -> AnyPublisher<[Pokemon], Error> {
        return pokemonService.get()
    }

    func find(pokemon: String) -> AnyPublisher<Pokemon, Error> {
        return pokemonService.find(pokemon: pokemon)
    }

}
