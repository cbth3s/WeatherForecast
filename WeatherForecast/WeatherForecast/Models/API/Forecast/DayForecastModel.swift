//
//  DayForecastModel.swift
//  WeatherForecast
//
//  Created by name surname on 04.06.2025.
//

import Foundation

struct DayForecastModel: Decodable {
    let avgTempC: Double
    let maxWindKph: Double
    let avgHumidity: Double
    let condition: ConditionModel
    
    var windSFSymbol: String { "wind" }
    var humiditySFSymbol: String { "humidity" }

    enum CodingKeys: String, CodingKey {
        case avgTempC = "avgtemp_c"
        case maxWindKph = "maxwind_kph"
        case avgHumidity = "avghumidity"
        case condition
    }
}
