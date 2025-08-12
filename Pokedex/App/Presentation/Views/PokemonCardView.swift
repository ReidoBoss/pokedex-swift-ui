//
//  PokemonCardView.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import SVGView
import SwiftUI

struct PokemonCardView: View {
    let pokemon: Pokemon

    init(_ pokemon: Pokemon) {
        self.pokemon = pokemon
    }

    var gradient: LinearGradient {
        .init(
            colors: pokemon.types.map { $0.type.name.color },
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(gradient)
            VStack {
                RemoteSVGView(url: URL(string: pokemon.sprite)!)
                Text(pokemon.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.white))
            }.padding()
        }
        .frame(height: 250)
    }
}

#Preview {
    let pokemonType: [Pokemon.PokemonType] = [
        .init(slot: 1, type: .init(name: .fire)),
        .init(slot: 2, type: .init(name: .flying)),

    ]
    let pokemonStat: [Pokemon.PokemonStat] = [
        .init(base: 78, stat: .init(name: .hp)),
        .init(base: 84, stat: .init(name: .attack)),
        .init(base: 78, stat: .init(name: .defense)),
        .init(base: 100, stat: .init(name: .speed)),
    ]
    let pokemon: Pokemon = Pokemon(
        id: 6,
        name: "charizard",
        weight: 905,
        height: 17,
        types: pokemonType,
        stats: pokemonStat,
        baseExp: 240
    )
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    ScrollView {
        LazyVGrid(columns: columns) {
            PokemonCardView(pokemon)
            PokemonCardView(pokemon)
        }
    }
}
