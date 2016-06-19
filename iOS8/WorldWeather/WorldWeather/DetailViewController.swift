//
//  DetailViewController.swift
//  WorldWeather
//
//  Created by ZhangBo on 16/6/19.
//  Copyright © 2016年 ZhangBo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    
    var cityWeather : CityWeather?

//    var detailItem: AnyObject? {
//        didSet {
//            // Update the view.
//            self.configureView()
//        }
//    }

//    func configureView() {
//        // Update the user interface for the detail item.
//        if let detail = self.detailItem {
//            if let label = self.detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.configureView()
        configureView()
        provideDataToChildViewControllers()
        // Prep the navigation item so the back button doesn't disappear
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.hidesBackButton = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - Utility methods
    private func configureView() {
        if let cityWeather = cityWeather {
            title = cityWeather.name
//            weatherIconImageView.image = cityWeather.weather[0].status.weatherType.image
        }
    }
    
    private func provideDataToChildViewControllers() {
        for vc in childViewControllers {
//            if var cityWeatherContainer = vc as? CityWeatherContainer {
//                cityWeatherContainer.cityWeather = cityWeather
//            }
        }
    }


}

