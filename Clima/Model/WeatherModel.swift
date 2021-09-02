//
//  WeatherModel.swift
//  Clima
//
//  Created by Jose Cantillo on 9/1/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let condtionalId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var condtionName: String {
        switch condtionalId {
        case 200...300:
            return "cloud.bolt.rain"
        case 300...400:
            return "cloud.drizzle"
        case 400...500:
            return "cloud.rain"
        case 500...600:
            return "cloud.snow"
        case 600...700:
            return "cloud.fog"
        case 800:
            return "sun.min"
        case 801...900:
            return "cloud"
        default:
            return "cloud"
        }
    }
        
        
        //    func getConditionName(weatherId: Int) -> String {
        //        switch weatherId {
        //        case 200...300:
        //            return "cloud.bolt.rain"
        //        case 300...400:
        //            return "cloud.drizzle"
        //        case 400...500:
        //            return "cloud.rain"
        //        case 500...600:
        //            return "cloud.snow"
        //        case 600...700:
        //            return "cloud.fog"
        //        case 800:
        //            return "sun.min"
        //        case 801...900:
        //            return "cloud"
        //        default:
        //            return "cloud"
        //
        //
        //        //            switch conditionID {
        //        //                    case 200...232:
        //        //                        return "cloud.bolt"
        //        //                    case 300...321:
        //        //                        return "cloud.drizzle"
        //        //                    case 500...531:
        //        //                        return "cloud.rain"
        //        //                    case 600...622:
        //        //                        return "cloud.snow"
        //        //                    case 701...781:
        //        //                        return "cloud.fog"
        //        //                    case 800:
        //        //                        return "sun.max"
        //        //                    case 801...804:
        //        //                        return "cloud.bolt"
        //        //                    default:
        //        //                        return "cloud"
        //        //                    }
        //
        //        }
        //    }
    }

