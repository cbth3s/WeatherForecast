//
//  APIResponseModel.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import Foundation

struct APIResponseModel: Decodable {
    let location: LocationModel
    let current: CurrentWeatherModel
    let forecast: ForecastModel
}
