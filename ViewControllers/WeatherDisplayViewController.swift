//
//  WeatherDisplayViewController.swift
//  WeatherApp
//
//  Created by Caleb Ogles on 11/15/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class WeatherDisplayViewController: UIViewController {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    
    var displayWeatherData: WeatherData! {
        didSet {
            iconLabel.text = displayWeatherData.condition.icon
            currentTemperatureLabel.text = "\(displayWeatherData.temperature)°"
            highTemperatureLabel.text = "\(displayWeatherData.highTemperature)°"
            lowTemperatureLabel.text = "\(displayWeatherData.lowTemperature)°"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude = 36.9959
        let longitude = -85.9119
        
//        APIManager.getWeather(at: (latitude, longitude)) { weatherData, error in
//            if let recievedData = weatherData {
//                self.displayWeatherData = recievedData
//
//            }
//
//            if let error = error {
//                print(error.localizedDescription)
//            }
//
//        }
        
    }
    
}
