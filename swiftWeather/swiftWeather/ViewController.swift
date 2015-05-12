//
//  ViewController.swift
//  swiftWeather
//
//  Created by tutujiaw on 15/5/12.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if isIos8() {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func isIos8() -> Bool {
        let strVer = UIDevice.currentDevice().systemVersion
        println(strVer)
        let arrVer = strVer.componentsSeparatedByString(".")
        return arrVer[0].toInt() == 8
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("location")
        if locations.count > 0 {
            let location = locations[0] as! CLLocation
            if location.horizontalAccuracy > 0 {
                locationManager.stopUpdatingLocation()
            }
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }

}

