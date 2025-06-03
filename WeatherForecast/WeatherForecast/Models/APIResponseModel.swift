//
//  APIResponseModel.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import Foundation

// Основной ответ API
struct APIResponseModel: Decodable {
    let location: Location
    let current: CurrentWeather
    let forecast: Forecast
}

// Локация (город, регион, страна)
struct Location: Decodable {
    let name: String
    let region: String
    let country: String
}

// Текущая погода
struct CurrentWeather: Decodable {
    let tempC: Double
    let condition: Condition
    let windKph: Double
    let humidity: Int

    // Кастомные ключи (т.к. в JSON snake_case, а в Swift camelCase)
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
        case humidity
    }
}

// Состояние погоды (текст + иконка)
struct Condition: Decodable {
    let text: String
    
    var sfSymbolName: String {
        switch text.lowercased() {
        case "sunny": return "sun.max.fill"
        case "clear": return "moon.stars.fill"
        case "partly cloudy ", "cloudy ": return "cloud.sun.fill"
        case "overcast ": return "cloud.fill"
        case "patchy rain nearby", "light rain", "light drizzle": return "cloud.drizzle.fill"
        case "light rain shower", "moderate rain" : return "cloud.rain.fill"
        case "heavy rain": return "cloud.heavyrain.fill"
        case "thundery outbreaks in nearby": return "cloud.bolt.rain.fill"
        default:
            print("👉🏿UNKNOWN WEATHER CONDITION: \(text)👈🏿")
            return "questionmark"
        }
    }
}

// Прогноз на 5 дней
struct Forecast: Decodable {
    let forecastday: [ForecastDay]
}

// Прогноз на 1 день
struct ForecastDay: Decodable {
    let date: String
    let day: DayForecast
    let hour: [HourlyForecast]
}

// Основные данные за день
struct DayForecast: Decodable {
    let avgTempC: Double
    let maxWindKph: Double
    let avgHumidity: Double
    let condition: Condition
    
    var windSFSymbol: String { "wind" }
    var humiditySFSymbol: String { "humidity" }

    enum CodingKeys: String, CodingKey {
        case avgTempC = "avgtemp_c"
        case maxWindKph = "maxwind_kph"
        case avgHumidity = "avghumidity"
        case condition
    }
}
// Данные за час
struct HourlyForecast: Decodable {
    let time: String         // Время в формате "2025-06-02 00:00"
    let tempC: Double
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
    }
}
