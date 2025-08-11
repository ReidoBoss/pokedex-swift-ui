//
//  NetworkService.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import Combine
import Foundation

struct NetworkService {
    func request<Response: Decodable>(
        _ url: URL
    ) -> AnyPublisher<Response, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode)
                else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

    }

}
