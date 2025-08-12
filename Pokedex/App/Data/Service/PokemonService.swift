//
//  PokemonService.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import Combine
import Foundation

struct PokemonService {

    private let baseApiUrl = AppConfig.shared.pokeApiBaseUrl

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func find(pokemon: String) -> AnyPublisher<Pokemon, Error> {
        guard let baseApiUrl else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        guard
            let url = URL(
                string: "https://" + baseApiUrl + "/pokemon/\(pokemon)"
            )
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return
            networkService
            .request(url)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()

    }

    /// gets a list of pokemon
    func get() -> AnyPublisher<[Pokemon], Error> {
        guard let baseApiUrl else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        guard
            let url = URL(
                string: "https://" + baseApiUrl + "/pokemon"
            )
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return
            networkService
            .request(url)
            .flatMap { (pokemonList: PokemonList) in
                Publishers.MergeMany(
                    pokemonList.results.compactMap {
                        pokeData -> AnyPublisher<Pokemon, Error>? in
                        guard let detailURL = URL(string: pokeData.url) else {
                            return nil
                        }
                        return networkService.request(detailURL)
                    }
                )
            }
            .collect()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
