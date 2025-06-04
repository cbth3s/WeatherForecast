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
    
    private let apiManager = APIManager.shared
    private let locationManager = LocationManager()
    
    init() {}
    
    func fetchWeather() async {
        
        isLoading = true
        errorMessage = nil
        
        locationManager.requestLocation()
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        if let location = locationManager.location {
            let coordinates = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
            print("!!!COORDINATES: \(coordinates)")
            await fetchWeather(for: coordinates)
        } else {
            await fetchWeather(for: "London")
        }
        
        isLoading = false
    }
    
    func fetchWeather(for city: String) async {
        
        guard !city.isEmpty else {
            errorMessage = "Please enter a city name"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            weatherData = try await apiManager.fetchForecast(for: city)
        } catch let error {
            errorMessage = error.localizedDescription
            print("API Error:", error)
        }
        
        isLoading = false
    }
    
}
