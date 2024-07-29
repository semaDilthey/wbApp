import Foundation
import UIKit

typealias Completion = (Result<UIImage, Error>) -> Void

final class ImageLoaderManager {
    
    private var cache = URLCache.shared

    func loadImage(urlString: String, completion: @escaping Completion) {
        guard let url = URL(string: urlString) else {
            completion(.failure(ImageLoaderError.invalidURL))
            return
        }

        if let cachedResponse = cache.cachedResponse(for: URLRequest(url: url)) {
            if let image = UIImage(data: cachedResponse.data) {
                completion(.success(image))
                print("from cache")
            } else {
                completion(.failure(ImageLoaderError.invalidData))
            }
            return
        }

        print("from internet")

        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data, let response = response else {
                completion(.failure(ImageLoaderError.invalidResponse))
                return
            }

            if let image = UIImage(data: data) {
                self?.cache.storeCachedResponse(CachedURLResponse(response: response, data: data), for: URLRequest(url: url))
                completion(.success(image))
            } else {
                completion(.failure(ImageLoaderError.invalidData))
            }
        }

        dataTask.resume()
    }
}

enum ImageLoaderError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
