//
//  APIManager.swift
//  WeatherApp
//
//  Created by Caleb Ogles on 11/14/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation
import Alamofire

struct APIManager {
    static func getWeather(at location: location, onComplete: @escaping (String?, Error?) -> Void) {
        
        let root = "https://api.darksky.net/forecast/"
        
        let key = APIKeys.darkSkyAPIKey
        
        let weatherURL = "\(root)/\(key)/\(location.latitude)/,\(location.longitude)"
        
        Alamofire.request(weatherURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                onComplete("\(value)", nil)
                
            case .failure(let error):
                onComplete(nil, error)
            }
        }
        
    }
}


