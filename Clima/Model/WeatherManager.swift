//
//  WeatherManager.swift
//  Clima
//
//  Created by Jose Cantillo on 9/1/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=imperial&appid=db24fd34d019bf5375c536205d4d35fc"
    
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
//    func fetchWeather(lat: Double, lon: Double) {
//        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
//        print(urlString)
//        performRequest(with: urlString)
//    }
    
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
           let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
           print(urlString)
           performRequest(with: urlString)
       }
    
    func performRequest(with urlString: String) {
        //1. Create a URL
        
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            
            //        let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
//                    print(error!)
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = parseJSON(safeData) {
//                        let weatherVC = WeatherViewController()
//                        weatherVC.didUpdateWeather(weather)
                        print("hi")
                        self.delegate?.didUpdateWeather(self, weather:weather)
                    }
                    //                    let dataString = String(data: safeData, encoding: .utf8)
                    //                    print(dataString)
                }
            }
            
            //4. Start the task
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(condtionalId: id, cityName: name, temperature: temp)
            return weather
            
            //            print(weather.getConditionName(weatherId: id))
            
            //            print(weather.condtionName)
            //            print(weather.temperatureString)
            //            print(decodedData.main.temp)
            //            print(decodedData.weather[0].description)
            //            print(decodedData.weather[0].id)
        } catch {
//            print(error)
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

//    func handle(data: Data?, response: URLResponse?, error: Error?) {
//        if error != nil {
//            print(error!)
//            return
//        }
//
//        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString)
//        }
//    }



