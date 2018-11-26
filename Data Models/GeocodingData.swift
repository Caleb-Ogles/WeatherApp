//
//  GeocodingData.swift
//  WeatherApp
//
//  Created by Caleb Ogles on 11/19/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation
import SwiftyJSON

class GeocodingData {
    enum GeocodingDataKeys: String {
        case results = "results"
        case formattedAddress = "formatted_address"
        case geometry = "geometry"
        case location = "location"
        case latitude = "lat"
        case longitude = "lng"
    }
    
    var formattedAddress: String
    var latitude: Double
    var longitude: Double
    
    init(formattedAddress: String, latitude: Double, longitude: Double) {
        self.formattedAddress = formattedAddress
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
    convenience init?(json: JSON) {
        guard let results = json[GeocodingDataKeys.results.rawValue].array,
            results.count > 0 else {
                print("not getting results")
                return nil
        }
        
        guard let formattedAddress = results[0][GeocodingDataKeys.formattedAddress.rawValue].string
            else {
                print("not getting formattedAddress")
                return nil
        }
        
        guard let latitude = results[0][GeocodingDataKeys.geometry.rawValue][GeocodingDataKeys.location.rawValue][GeocodingDataKeys.latitude.rawValue].double else {
            print("not getting latitude")
            return nil
        }
        
        guard let longitude = results[0][GeocodingDataKeys.geometry.rawValue][GeocodingDataKeys.location.rawValue][GeocodingDataKeys.longitude.rawValue].double else {
            print("not getting longitude")
            return nil
        }
        
        self.init(formattedAddress: formattedAddress, latitude: latitude, longitude: longitude)
    }
}
