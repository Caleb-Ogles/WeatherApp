//
//  ViewController.swift
//  WeatherApp
//
//  Created by Caleb Ogles on 11/14/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude = 42.3601
        let longitude = -71.0589
        
        APIManager.getWeather(at: (latitude, longitude)) {value, error in
            
            guard let value = value else {
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Sorry No Error Description")
                }
                self.view.backgroundColor = .red
                return
            }
            print(value)
            self.view.backgroundColor = .green
        }
        
    }
        
}




