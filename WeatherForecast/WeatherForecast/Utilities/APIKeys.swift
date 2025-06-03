//
//  APIKeys.swift
//  WeatherForecast
//
//  Created by name surname on 03.06.2025.
//

import Foundation

enum APIKeys {
    static var weatherAPIKey: String {
        guard let key = Bundle.main.infoDictionary?["APIKey"] as? String else {
            fatalError("""
            WEATHER_API_KEY не найден в Info.plist.
            1. Добавьте ключ в .xcconfig файл
            2. Убедитесь, что .xcconfig подключен к таргету
            3. Проверьте, что ключ добавлен в Info.plist
            """)
        }
        return key
    }
}
