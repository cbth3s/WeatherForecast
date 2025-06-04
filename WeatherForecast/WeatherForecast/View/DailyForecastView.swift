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
               Text("Прогноз на 5 дней")
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
           .background(Color.background)
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


struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        let testForecastDays = [
            ForecastDay(
                date: "2025-06-03",
                day: DayForecast(
                    avgTempC: 22.5,
                    maxWindKph: 15.3,
                    avgHumidity: 65.0,
                    condition: Condition(text: "Sunny")
                ),
                hour: []
            ),
            ForecastDay(
                date: "2025-06-04",
                day: DayForecast(
                    avgTempC: 18.2,
                    maxWindKph: 20.1,
                    avgHumidity: 80.0,
                    condition: Condition(text: "Rain")
                ),
                hour: []
            ),
            ForecastDay(
                date: "2025-06-05",
                day: DayForecast(
                    avgTempC: 25.7,
                    maxWindKph: 12.4,
                    avgHumidity: 45.0,
                    condition: Condition(text: "Partly Cloudy")
                ),
                hour: []
            ),
            ForecastDay(
                date: "2025-06-06",
                day: DayForecast(
                    avgTempC: 16.8,
                    maxWindKph: 18.6,
                    avgHumidity: 70.0,
                    condition: Condition(text: "Overcast")
                ),
                hour: []
            ),
            ForecastDay(
                date: "2025-06-07",
                day: DayForecast(
                    avgTempC: 12.3,
                    maxWindKph: 25.0,
                    avgHumidity: 85.0,
                    condition: Condition(text: "Thunderstorm")
                ),
                hour: []
            )
        ]
        
        return Group {
            DailyForecastView(forecastDays: testForecastDays)
                .previewDisplayName("Light Mode")
                .preferredColorScheme(.light)
            
            DailyForecastView(forecastDays: testForecastDays)
                .previewDisplayName("Dark Mode")
                .preferredColorScheme(.dark)
            
            DailyForecastView(forecastDays: testForecastDays)
                .previewDisplayName("Large Text")
                .environment(\.sizeCategory, .accessibilityLarge)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
