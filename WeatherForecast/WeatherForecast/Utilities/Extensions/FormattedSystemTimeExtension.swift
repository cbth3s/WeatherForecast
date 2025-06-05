//
//  FormattedSystemTimeExtension.swift
//  WeatherForecast
//
//  Created by name surname on 05.06.2025.
//

import Foundation

extension String {
    func formattedSystemTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = formatter.date(from: self) else { return self }
        
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter.string(from: date)
    }
}
