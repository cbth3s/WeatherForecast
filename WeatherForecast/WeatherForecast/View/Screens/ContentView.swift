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
    @State private var showSearchBar = false
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                if showSearchBar {
                    CustomSearchStringView(
                        searchText: $searchText,
                        showSearchBar: $showSearchBar,
                        vm: vm
                    )
                }
                
                VStack(spacing: 20) {
                    
                    if !showSearchBar {
                        Button{ showSearchBar = true }
                        label: {
                            Image(systemName: "magnifyingglass")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing)
                                .foregroundStyle(.gray)
                        }
                    }
                    
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
            .onAppear {
                Task {
                    await vm.fetchWeather()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
