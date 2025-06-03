//
//  APIManager.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import Foundation

class APIManager {
    
    private static var apiKey: String {
        guard let key = Bundle.main.infoDictionary?["APIKey"] as? String else {
            fatalError("APIKey не найден. Проверьте .xcconfig и настройки таргета.")
        }
        return key
    }
    
    static func fetchForecast(for city: String, completion: @escaping (Result<APIResponseModel, Error>) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.weatherapi.com"
        urlComponents.path = "/v1/forecast.json"
        urlComponents.queryItems = [
                    URLQueryItem(name: "key", value: apiKey),
                    URLQueryItem(name: "q", value: city),
                    URLQueryItem(name: "days", value: "5")
                ]
        
        guard let url = urlComponents.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(APIResponseModel.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

