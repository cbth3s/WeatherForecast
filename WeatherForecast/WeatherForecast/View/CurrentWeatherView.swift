//
//  CurrentWeatherView.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    let current: CurrentWeather
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(Int(current.tempC))°")
                    .font(.system(size: 48, weight: .bold))
                
                Image(systemName: current.condition.sfSymbolName)
                    .font(.system(size: 40))
                    .symbolRenderingMode(.multicolor)
            }
            
            Text(current.condition.text)
                .font(.title3)
            
            HStack(spacing: 16) {
                Label("\(Int(current.windKph)) км/ч", systemImage: "wind")
                Label("\(current.humidity)%", systemImage: "humidity")
            }
            .font(.subheadline)
        }
        .padding()
        .background(Color.background)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

