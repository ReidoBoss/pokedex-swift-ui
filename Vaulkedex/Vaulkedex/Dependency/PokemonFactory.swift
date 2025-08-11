//
//  PokemonFactory.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import Factory

extension Container {

    var pokemonService: Factory<PokemonService> {
        self {
            PokemonService(
                networkService: self.networkService()
            )
        }
    }

    var pokemonRepo: Factory<PokemonRepository> {
        self {
            PokemonRepositoryImpl(
                pokemonService: self.pokemonService()
            )
        }

    }

    var pokemonUseCase: Factory<PokemonUseCase> {
        self {
            PokemonUseCaseImpl(repo: self.pokemonRepo())
        }
    }

}
