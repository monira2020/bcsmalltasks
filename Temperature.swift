//
//  Temperature.swift
//  SmallWeatherApp
//
//  Created by Monisha Ravi on 9/4/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let temperature = try? newJSONDecoder().decode(Temperature.self, from: jsonData)

import Foundation

// MARK: - TemperatureElement
struct Temperature: Codable {
    let dateTime: Date
    let epochDateTime, weatherIcon: Int
    let iconPhrase: String
    let hasPrecipitation, isDaylight: Bool
    let temperature, realFeelTemperature, realFeelTemperatureShade, wetBulbTemperature: Ceiling
    let dewPoint: Ceiling
    let wind: Wind
    let windGust: WindGust
    let relativeHumidity, indoorRelativeHumidity: Int
    let visibility, ceiling: Ceiling
    let uvIndex: Int
    let uvIndexText: String
    let precipitationProbability, thunderstormProbability, rainProbability, snowProbability: Int
    let iceProbability: Int
    let totalLiquid, rain, snow, ice: Ceiling
    let cloudCover: Int
    let evapotranspiration, solarIrradiance: Ceiling
    let mobileLink, link: String
}

// MARK: - Ceiling
struct Ceiling: Codable {
    let value: Double
    let unit: String
    let unitType: Int
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Ceiling
    let direction: Direction
}

// MARK: - Direction
struct Direction: Codable {
    let degrees: Int
    let localized, english: String
}

// MARK: - WindGust
struct WindGust: Codable {
    let speed: Ceiling
}

