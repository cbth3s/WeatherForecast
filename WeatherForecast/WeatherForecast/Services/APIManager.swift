//
//  APIManager.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    private let apiKey = APIKeys.weatherAPIKey
    
    func fetchForecast(for city: String) async throws -> APIResponseModel {
        
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
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(APIResponseModel.self, from: data)
    }
}


