//
//  Service.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/29/23.
//

import Foundation

struct NetworkService {
    let APIKey = ""
    private let baseURL = "https://api.openai.com/v1/chat/completions"
    
    func sendRequest(with prompt: String, completion: @escaping (Result<Root, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(APIKey)", forHTTPHeaderField: "Authorization")

        let body: [String: Any] = [
            "model": "gpt-4",
            "messages": [
                ["role": "user", "content": prompt]
            ],
            "max_tokens": 3200,
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData

        let urlConfig = URLSessionConfiguration.default
        urlConfig.timeoutIntervalForRequest = 120 // 30 seconds
        urlConfig.timeoutIntervalForResource = 180 // 60 seconds
        let session = URLSession(configuration: urlConfig)

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let root = try decoder.decode(Root.self, from: data)
                    completion(.success(root))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }

    
    enum NetworkError: Error {
        case invalidURL
    }
}
