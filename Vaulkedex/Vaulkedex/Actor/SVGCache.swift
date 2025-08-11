//
//  SVGCache.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import SVGView
import SwiftUI

actor SVGCache {
    static let shared = SVGCache()

    private var memoryCache = NSCache<NSURL, NSData>()

    func data(for url: URL) async throws -> Data {

        if let cachedData = memoryCache.object(forKey: url as NSURL) {
            return cachedData as Data
        }

        let fileURL = cacheFilePath(for: url)
        if let diskData = try? Data(contentsOf: fileURL) {
            memoryCache.setObject(diskData as NSData, forKey: url as NSURL)
            return diskData
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        memoryCache.setObject(data as NSData, forKey: url as NSURL)
        try? data.write(to: fileURL)
        return data
    }

    private func cacheFilePath(for url: URL) -> URL {
        let caches = FileManager.default.urls(
            for: .cachesDirectory,
            in: .userDomainMask
        ).first!
        return caches.appendingPathComponent(url.lastPathComponent)
    }
}
