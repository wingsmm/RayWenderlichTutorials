//
//  WeatherData.swift
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


class WeatherData {
    
    private(set) var cities = [CityWeather]()

    init (plistNamed: String){
        self.cities = loadWeatherData(plistNamed)
    }

    convenience init(){
        self.init(plistNamed: "WeatherData")
    }


    private  func  loadWeatherData(plistNamed : String) -> [CityWeather]{

        let path : NSString? =  NSBundle.mainBundle().pathForResource(plistNamed , ofType: "plist")
        
        let plistRoot : NSDictionary? = NSDictionary(contentsOfFile:path as! String)
        var  cityWeather = [CityWeather]()
        for (name, dailyWeather) in plistRoot as! [String : [NSDictionary]] {
            cityWeather.append(CityWeather(array: dailyWeather, name: name))
        }

        return cityWeather
    }
}


extension CityWeather {
    
    private convenience init (array : [NSDictionary] , name : String){
        
        var  dailyWeather = [DailyWeather]()
        for dict  in array {
            dailyWeather.append(DailyWeather.init(dictionary: dict))
        }
        self.init(name: name ,weather: dailyWeather);
    }
}


extension DailyWeather {
    
    private convenience init (dictionary : NSDictionary){
        let status = WeatherStatus(dictionary : dictionary)
        self.init (date : dictionary["date"] as! NSDate, status: status)
    }
    
}

extension WeatherStatus {
    
    private  init (dictionary : NSDictionary){
        let dictType = dictionary["type"] as! String
        let temperature =  dictionary["temperature"] as! Int
        let type = WeatherStatusType(rawValue: dictType)!
        self.init(temperature: temperature, type: type )
    }
    
}

