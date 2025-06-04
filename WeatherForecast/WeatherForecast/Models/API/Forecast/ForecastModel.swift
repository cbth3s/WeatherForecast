//
//  ForecastModel.swift
//  WeatherForecast
//
//  Created by name surname on 04.06.2025.
//

import Foundation

struct ForecastModel: Decodable {
    let forecastday: [ForecastDayModel]
}
