//
//  HourlyForecastView.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import SwiftUI

struct HourlyForecastView: View {
    
    let hours: [HourlyForecast]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Прогноз на 24 часа:")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(hours.prefix(24), id: \.time) { hour in
                        VStack(spacing: 8) {
                            Text(hour.time.formattedSystemTime())
                            Image(systemName: hour.condition.sfSymbolName)
                                .symbolRenderingMode(.multicolor)
                            Text("\(Int(hour.tempC))°")
                        }
                        .padding(8)
                        .background(Color.background)
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

extension String {
    func formattedSystemTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = formatter.date(from: self) else { return self }
        
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter.string(from: date)
    }
}

