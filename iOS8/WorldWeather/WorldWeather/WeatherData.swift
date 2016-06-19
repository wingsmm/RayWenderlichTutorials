//
//  WeatherData.swift
//  WorldWeather
//
//  Created by ZhangBo on 16/6/19.
//  Copyright © 2016年 ZhangBo. All rights reserved.
//

import Foundation



class WeatherData {
    
    private(set) var cities = [CityWeather]()

    init (plistNamed: String){
        self.cities = loadWeatherData(plistNamed)
    }

    convenience init(){
        self.init(plistNamed: "WeatherData")
    }


    private  func  loadWeatherData(plistNamed : String) -> [CityWeather]{

        let plistRoot : NSDictionary? = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource(plistNamed , ofType: "plist")!)
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

