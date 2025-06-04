//
//  ForecastDayModel.swift
//  WeatherForecast
//
//  Created by name surname on 04.06.2025.
//

import Foundation

struct ForecastDayModel: Decodable {
    let date: String
    let day: DayForecastModel
    let hour: [HourlyForecastModel]
}
