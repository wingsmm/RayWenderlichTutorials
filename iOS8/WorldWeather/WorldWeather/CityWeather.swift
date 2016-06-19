//
//  CityWeather.swift
//  WorldWeather
//
//  Created by ZhangBo on 16/6/19.
//  Copyright © 2016年 ZhangBo. All rights reserved.
//

import Foundation
import UIKit

class CityWeather {

    var name : String = ""
    var weather :[DailyWeather]

    var cityImage : UIImage {
        return UIImage(named:name)!
    }

    init (name : String , weather : [DailyWeather]){
        self.name = name
        self.weather = weather
    }
}