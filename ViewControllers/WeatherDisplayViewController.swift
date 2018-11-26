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
    
    @IBOutlet weak var locationLabel: UILabel!
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
    
    var displayGeocodingData: GeocodingData! {
        didSet {
            locationLabel.text = displayGeocodingData.formattedAddress
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultUI()
        
    }
    
    func setupDefaultUI() {
        locationLabel.text = ""
        iconLabel.text = "😐"
        currentTemperatureLabel.text = "Enter a location"
        highTemperatureLabel.text = "-"
        lowTemperatureLabel.text = "-"
    }
    
    @IBAction func unwindToWeatherDisplay(segue: UIStoryboardSegue) { }
    
}
