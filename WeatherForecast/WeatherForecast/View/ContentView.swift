//
//  ContentView.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = WeatherViewModel()
    @State private var city = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Enter city name", text: $city, onCommit: {
                    Task { await vm.fetchWeather(for: city) }
                })
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .submitLabel(.search)
                
                if vm.isLoading {
                    ProgressView()
                } else if let error = vm.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
                
                if let weather = vm.weatherData {
                    VStack(spacing: 20) {
                        // Location info
                        VStack {
                            Text(weather.location.name)
                                .font(.title)
                            Text("\(weather.location.region), \(weather.location.country)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        // Current weather
                        CurrentWeatherView(current: weather.current)
                        
                        // Hourly forecast (horizontal scroll)
                        HourlyForecastView(hours: weather.forecast.forecastday.first?.hour ?? [])
                        
                        // Daily forecast
                        DailyForecastView(forecastDays: weather.forecast.forecastday)
                        
                    }
                    .padding(.horizontal)
                } else {
                    Text("Enter city to see weather")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical)
        }
        .background(Color.background)
        .navigationTitle("Weather Forecast")
    }
}

#Preview {
    ContentView()
}
