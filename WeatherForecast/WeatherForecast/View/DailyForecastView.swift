//
//  DailyForecastView.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import SwiftUI

struct DailyForecastView: View {
    
    let forecastDays: [ForecastDay]
    
    var body: some View {
        VStack(alignment: .leading) {
               Text("5-Day Forecast")
                   .font(.headline)
                   .padding(.horizontal)
               
               ForEach(forecastDays.prefix(5), id: \.date) { day in
                   HStack {
                       Text(day.date.formattedDate())
                           .frame(width: 100, alignment: .leading)
                       
                       Image(systemName: day.day.condition.sfSymbolName)
                           .frame(width: 30)
                           .symbolRenderingMode(.multicolor)
                       
                       Text("\(Int(day.day.avgTempC))°")
                           .frame(width: 40, alignment: .trailing)
                       
                       ProgressView(value: Double(day.day.avgHumidity)/100)
                           .frame(width: 60)
                       
                       Text("\(Int(day.day.maxWindKph)) km/h")
                           .frame(width: 60, alignment: .trailing)
                   }
                   .padding(.vertical, 4)
               }
           }
           .padding()
           .background(Color(.gray))
           .cornerRadius(12)
           .shadow(radius: 5)
    }
}

extension String {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self) else { return self }
        
        formatter.dateFormat = "E, MMM d"
        return formatter.string(from: date)
    }
}
