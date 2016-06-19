//
//  DailyWeather.swift
//  WorldWeather
//
//  Created by ZhangBo on 16/6/19.
//  Copyright © 2016年 ZhangBo. All rights reserved.
//

import Foundation


let dayNameDateFormatter = NSDateFormatter()

class DailyWeather {
    
    private(set) var date : NSDate
    private(set) var status : WeatherStatus
    
    
    var dayName : String {
        dayNameDateFormatter.dateFormat = "E"
        return dayNameDateFormatter.stringFromDate(date)
    }
    
    init(date: NSDate , status : WeatherStatus){
        self.date = date
        self.status = status
    }

}