//
//  StatBar.swift
//  Vaulkedex
//
//  Created by Stephen Sagarino on 8/11/25.
//

import SwiftUI

struct StatBar: View {
    let current: Int
    let max: Int
    var barColor: Color = .red
    var height: CGFloat = 20

    var barText: String {
        "\(current) / \(max)"
    }

    var fraction: Double {
        guard max > 0 else { return 0 }
        return min(Swift.max(Double(current) / Double(max), 0), 1)
    }

    var body: some View {

        GeometryReader { geometry in
            let totalWidth = geometry.size.width
            ZStack {
                background
                currentBar(width: totalWidth)
                ZStack {
                    Text(barText)
                        .foregroundColor(.primary)
                    HStack {
                        Text(barText)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .mask(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: fraction * (totalWidth))
                    }
                }
            }
            .frame(height: height)
        }
        .frame(height: height)
    }

    private func currentBar(width: Double) -> some View {

        RoundedRectangle(cornerRadius: 12.0)
            .fill(barColor)
            .frame(width: fraction * width)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private let background: some View =
        RoundedRectangle(cornerRadius: 12.0)
        .fill(Color(.systemGray))
}

#Preview {
    StatBar(current: 210, max: 300)
    StatBar(current: 140, max: 300)
    StatBar(current: 40, max: 300)
    StatBar(current: 124, max: 300)
    StatBar(current: 123, max: 300)

}
