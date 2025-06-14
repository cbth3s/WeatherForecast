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
        case "пасмурно", "облачно", "переменная облачность" : return "cloud.fill"
        case "местами дождь", "умеренный дождь", "слабая морось", "местами небольшой дождь", "небольшой дождь", "местами слабая морось" : return "cloud.drizzle.fill"
        case "дымка", "туман": return "smoke.fill"
        case "небольшой ливневый дождь", "временами умеренный дождь" : return "cloud.rain.fill"
        case "сильный дождь": return "cloud.heavyrain.fill"
        case "в отдельных районах умеренный или сильный дождь с грозой", "в отдельных районах местами небольшой дождь с грозой", "местами грозы": return "cloud.bolt.rain.fill"
        default:
            print("👉🏿UNKNOWN WEATHER CONDITION: \(text)👈🏿")
            return "questionmark"
        }
    }
}
