//
//  RemoteSVGView.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import SVGView
import SwiftUI

struct RemoteSVGView: View {
    let url: URL
    @State private var svgData: Data?

    var body: some View {
        Group {
            if let svgData {
                SVGView(data: svgData)
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
                    .task {
                        await loadSVG()
                    }
            }
        }
    }

    private func loadSVG() async {
        do {
            svgData = try await SVGCache.shared.data(for: url)
        } catch {
            print("Failed to load SVG: \(error)")
        }
    }
}
