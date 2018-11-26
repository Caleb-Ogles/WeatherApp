//
//  APIManager.swift
//  WeatherApp
//
//  Created by Caleb Ogles on 11/14/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct APIManager {
    
    enum APIErrors: Error {
        case noData
        case noResponse
        case invalidData
    }
    
    func getWeather(at location: location, onComplete: @escaping (WeatherData?, Error?) -> Void) {
        
        let root = "https://api.darksky.net/forecast/"
        
        let key = APIKeys.darkSkyAPIKey
        
        let weatherURL = "\(root)\(key)/\(location.latitude),\(location.longitude)"
        
        Alamofire.request(weatherURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let weatherData = WeatherData(json: json) {
                    onComplete(weatherData, nil)
                } else {
                    onComplete(nil, APIErrors.invalidData)
                }
                
            case .failure(let error):
                onComplete(nil, error)
            }
        }
        
    }
    
    func geocode(address: String, onCompletion: @escaping (GeocodingData?, Error?) -> Void) {
        
        let googleURL = "https://maps.googleapis.com/maps/api/geocode/json?address="
        
        let geoURL = googleURL + address + "&key=" + APIKeys.GeocodingAPIKey
        
        let request = Alamofire.request(geoURL)
        
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let geocodingData = GeocodingData(json: json) {
                    onCompletion(geocodingData, nil)
                } else {
                    onCompletion(nil, APIErrors.invalidData)
                }
            case .failure(let error):
                onCompletion(nil, error)
            }
            
        }
    }
    
    
    
    
    
}


