//
//  WeatherViewModel.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    
    @Published var weatherData: APIResponseModel?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let manager = APIManager.shared
    
    init() {}
    
    func fetchWeather(for city: String) async {
        
        guard !city.isEmpty else {
            errorMessage = "Please enter a city name"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            weatherData = try await manager.fetchForecast(for: city)
            print("Received data: \(weatherData)") // Проверь ответ API
        } catch let error {
            errorMessage = error.localizedDescription
            print("API Error:", error)
        }
        
        isLoading = false
    }
    
}
