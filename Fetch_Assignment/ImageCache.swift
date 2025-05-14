//
//  ImageCache.swift
//  Fetch_Assignment
//
//  Created by Manikantan Eakiri Lakshmanan on 5/13/25.
//

import SwiftUI

final class ImageCache {
    static let shared = ImageCache()

    private let cacheDirectory: URL

    private init() {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        cacheDirectory = urls[0].appendingPathComponent("RecipeImageCache")
        try? FileManager.default.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    }

    func image(for url: URL) async -> UIImage? {
        let fileURL = cacheDirectory.appendingPathComponent(url.lastPathComponent)

        if let data = try? Data(contentsOf: fileURL), let image = UIImage(data: data) {
            return image
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            try data.write(to: fileURL)
            return UIImage(data: data)
        } catch {
            return nil
        }
    }
}

