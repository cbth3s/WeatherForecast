//
//  DailyForecastView.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import SwiftUI

struct DailyForecastView: View {
    
    let forecastDays: [ForecastDayModel]
    
    var body: some View {
        VStack(alignment: .leading) {
               Text("Прогноз на 5 дней: ")
                   .font(.headline)
            
            Divider()
               
               ForEach(forecastDays.prefix(5), id: \.date) { day in
                   HStack {
                       
                       Text(day.date.formattedDate())
                           .frame(width: 100, alignment: .leading)
                       
                       Image(systemName: day.day.condition.sfSymbolName)
                           .frame(width: 30)
                           .symbolRenderingMode(.multicolor)
                       
                       Text("\(Int(day.day.avgTempC))°")
                           .frame(width: 40, alignment: .trailing)
                       
                       VStack {
                           Image(systemName: "humidity")
                               .font(.caption2)
                           ProgressView(value: Double(day.day.avgHumidity)/100)
                               .frame(width: 60)
                       }
                       
                       VStack {
                           Image(systemName: "wind")
                               .font(.caption2)
                           Text("\(Int(day.day.maxWindKph)) км/ч")
                               .frame(width: 70, alignment: .trailing)
                       }
                   }
                   .padding(.vertical, 4)
                   
                   Divider()
               }
           }
           .padding()
           .background(Color.days)
           .cornerRadius(12)
           .shadow(radius: 5)
    }
}

extension String {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self) else { return self }
        
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "E, d MMM"
        
        return formatter.string(from: date)
    }
}

