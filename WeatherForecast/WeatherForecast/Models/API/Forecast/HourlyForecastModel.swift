//
//  HourlyForecastModel.swift
//  WeatherForecast
//
//  Created by name surname on 04.06.2025.
//

import Foundation

struct HourlyForecastModel: Decodable {
    let time: String         // Время в формате "2025-06-02 00:00"
    let tempC: Double
    let condition: ConditionModel
    
    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
    }
}
