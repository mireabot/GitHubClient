//
//  NetworkManager.swift
//  GitDemo
//
//  Created by Mikhail Kolkov on 14.01.21.

import Foundation

// Code for generic API calling and decoding of response
class NetworkManager {
    
    static let shared = NetworkManager()
    
     func request<T: Decodable>(endpoint: EndPoints, completion: @escaping (Result<T,Error>) -> ()) {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseUrl
        components.path = endpoint.path
        components.queryItems = endpoint.parameter
        
        guard let url = components.url else { return }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard response != nil, let data = data else { return }
            
            print(data)
            
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                if let responseObject = try? decoder.decode(T.self, from: data) {
                    completion(.success(responseObject))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode resoponse"])
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}

extension URL {

    mutating func appendQueryItem(name: String, value: String?) {

        guard var urlComponents = URLComponents(string: absoluteString) else { return }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: name, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        self = urlComponents.url!
    }
}
