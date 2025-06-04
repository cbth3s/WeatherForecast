//
//  CondtionModelExtension.swift
//  WeatherForecast
//
//  Created by name surname on 04.06.2025.
//

import Foundation

extension ConditionModel {
    var sfSymbolName: String {
        switch text.lowercased() {
        case "солнечно": return "sun.max.fill"
        case "ясно": return "moon.stars.fill"
        case "переменная облачность", "облачно": return "cloud.sun.fill"
        case "пасмурно": return "cloud.fill"
        case "местами дождь", "умеренный дождь", "слабая морось", "местами небольшой дождь": return "cloud.drizzle.fill"
        case "light rain shower", "moderate rain" : return "cloud.rain.fill"
        case "heavy rain": return "cloud.heavyrain.fill"
        case "в отдельных районах умеренный или сильный дождь с грозой": return "cloud.bolt.rain.fill"
        default:
            print("👉🏿UNKNOWN WEATHER CONDITION: \(text)👈🏿")
            return "questionmark"
        }
    }
}
