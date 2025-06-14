//
//  ContentView.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = WeatherViewModel()
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea(.all)
                
                VStack(spacing: 20) {
                    
                    if vm.isLoading {
                        ProgressView()
                    } else if let error = vm.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                    }
                    
                    if let weather = vm.weatherData {
                        VStack(spacing: 20) {
                            VStack {
                                Text(weather.location.name)
                                    .font(.title)
                                Text("\(weather.location.region), \(weather.location.country)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            CurrentWeatherView(current: weather.current)
                            
                            HourlyForecastView(
                                hours: weather.forecast.forecastday.first?.hour ?? []
                            )
                            
                            DailyForecastView(
                                forecastDays: weather.forecast.forecastday
                            )
                        }
                        .padding(.horizontal)
                    } else {
                        Text("Введите город, чтобы посмотреть погоду")
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical)
                
            }
        }
        .searchable(text: $searchText,
                    isPresented: $isSearching,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: "Найдите город"
        )
        .onSubmit(of: .search) {
            Task {
                await vm.fetchWeather(for: searchText)
            }
        }
        .onAppear {
            Task {
                await vm.fetchWeather()
            }
        }
    }
}

#Preview {
    ContentView()
}
