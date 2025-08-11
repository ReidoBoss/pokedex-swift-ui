//
//  NetworkFactory.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import Factory

extension Container {

    var networkService: Factory<NetworkService> {
        self { NetworkService() }
    }
}
