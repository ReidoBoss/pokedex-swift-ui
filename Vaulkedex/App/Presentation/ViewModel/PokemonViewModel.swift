//
//  PokemonViewModel.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import Combine
import Observation

@Observable
final class PokemonViewModel {
    private(set) var isLoading = false
    private(set) var pokemons: [Pokemon] = []

    private let pokemonUseCase: PokemonUseCase
    private var cancellables = Set<AnyCancellable>()

    init(pokemonUseCase: PokemonUseCase) {
        self.pokemonUseCase = pokemonUseCase
    }

    func get() {
        self.isLoading = true
        pokemonUseCase
            .execute(.getList)
            .sink(
                receiveCompletion: { completion in
                    // TODO: - catch errors
                    print(completion)
                    self.isLoading = false
                },
                receiveValue: { pokemons in
                    self.pokemons = pokemons
                    self.isLoading = false
                }
            ).store(in: &cancellables)
    }

}
