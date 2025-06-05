//
//  FormattedDateExtension.swift
//  WeatherForecast
//
//  Created by name surname on 05.06.2025.
//

import Foundation

extension String {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self) else { return self }
        
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "E, d MMM"
        
        return formatter.string(from: date)
    }
}
