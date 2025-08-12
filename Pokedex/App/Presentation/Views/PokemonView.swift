//
//  PokemonView.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/10/25.
//

import SVGView
import SwiftUI

struct PokemonView: View {
    let pokemon: Pokemon
    init(_ pokemon: Pokemon) {
        self.pokemon = pokemon
    }

    var gradient: RadialGradient {
        .init(
            colors: pokemon.types.map { $0.type.name.color },
            center: .bottom,
            startRadius: 0,
            endRadius: 400
        )
    }
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                pokemonPic
                Text(pokemon.name.capitalized)
                    .font(.title)
                    .fontWeight(.semibold)
                types
                metrics
                stats
            }
        }.ignoresSafeArea(edges: .top)
    }

    var pokemonPic: some View {
        ZStack {
            gradient
                .scaleEffect(3)
                .opacity(0.4)

            RemoteSVGView(url: URL(string: pokemon.sprite)!)
                .padding(20)
                .padding(.top, 40)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
    }

    var types: some View {
        HStack {
            ForEach(pokemon.types) { pokemonType in
                Image(pokemonType.type.name.rawValue.capitalized)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }

    @ViewBuilder
    var metrics: some View {
        let weight = "\(Double(pokemon.weight) / 10) KG"
        let height = "\(Double(pokemon.height) / 10) M"

        HStack(spacing: 75) {
            VStack(spacing: 20) {
                Text(weight)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("Weight")
                    .font(.subheadline)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            VStack(spacing: 20) {
                Text(height)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("Height")
                    .font(.subheadline)
                    .foregroundStyle(Color(.secondaryLabel))
            }
        }
    }

    var pokemonStats: [Pokemon.PokemonStat] {
        pokemon.stats
            .filter { stat in
                stat.stat.name != .specialAttack
                    && stat.stat.name != .specialDef
            }
    }

    var stats: some View {
        VStack {
            Text("Base Stats")
                .fontWeight(.medium)
                .font(.title)
            ForEach(pokemonStats) { stat in
                let pokeStat = stat.stat
                HStack {
                    Text(pokeStat.title)
                        .foregroundStyle(.secondary)
                        .frame(width: 40)
                    StatBar(
                        current: stat.base,
                        max: 300,
                        barColor: pokeStat.color
                    )
                }
            }

            HStack {
                Text("EXP")
                    .foregroundStyle(.secondary)
                    .frame(width: 40)
                StatBar(
                    current: pokemon.baseExp,
                    max: 1000,
                    barColor: Color(.systemGreen)
                )
            }

        }.padding()
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

    PokemonView(pokemon)

}
