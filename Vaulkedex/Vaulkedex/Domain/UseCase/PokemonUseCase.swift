//
//  PokemonUseCase.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import Combine
import Foundation

protocol PokemonUseCase {

    func execute(
        _ action: PokemonUseCaseImpl.Action
    ) -> AnyPublisher<[Pokemon], Error>

    func execute(
        find: String
    ) -> AnyPublisher<Pokemon, Error>

}

struct PokemonUseCaseImpl: PokemonUseCase {
    private let repo: PokemonRepository
    init(repo: PokemonRepository) {
        self.repo = repo
    }
    func execute(
        _ action: Action
    ) -> AnyPublisher<[Pokemon], Error> {
        switch action {
        case .getList: repo.get()
        }
    }

    func execute(
        find pokemon: String
    ) -> AnyPublisher<Pokemon, Error> {
        repo.find(pokemon: pokemon)
    }

}

extension PokemonUseCaseImpl {
    enum Action {
        case getList
    }
}
