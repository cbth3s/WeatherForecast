//
//  CurrentWeatherModel.swift
//  WeatherForecast
//
//  Created by name surname on 04.06.2025.
//

import Foundation

struct CurrentWeatherModel: Decodable {
    let tempC: Double
    let condition: ConditionModel
    let windKph: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
        case humidity
    }
}
