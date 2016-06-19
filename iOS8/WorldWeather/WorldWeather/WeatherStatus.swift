//
//  WeatherStatus.swift
//  WorldWeather
//
//  Created by ZhangBo on 16/6/19.
//  Copyright © 2016年 ZhangBo. All rights reserved.
//

import Foundation
import UIKit


enum WeatherStatusType : String {
    case Sun = "sun"
    case Cloud = "cloud"
    case Lightning = "lightning"
    var image :UIImage {
        return UIImage(named: self.rawValue)!
    }
    
}

struct WeatherStatus {
    private(set) var temperature : Int
    private(set) var weatherType : WeatherStatusType
    
    init (temperature : Int , type : WeatherStatusType){
        self.temperature = temperature
        self.weatherType = type
    }
}


