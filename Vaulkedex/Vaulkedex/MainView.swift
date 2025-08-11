//
//  MainView.swift
//  Vaulkedex
//
//  Created by Stephen T. Sagarino Jr. on 8/5/25.
//

import Factory
import SwiftUI

struct MainView: View {
    @Injected(\.pokemonViewModel) var pokemonViewModel

    init() {
        pokemonViewModel.get()
    }

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            Group {
                if pokemonViewModel.isLoading {
                    VStack {
                        ProgressView("Loading Pokémon…")
                            .progressViewStyle(
                                CircularProgressViewStyle(tint: .blue)
                            )
                            .scaleEffect(1.5)
                            .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(pokemonViewModel.pokemons) { pokemon in
                                NavigationLink(
                                    destination: PokemonView(pokemon)
                                ) {
                                    PokemonCardView(pokemon)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    MainView()
}
