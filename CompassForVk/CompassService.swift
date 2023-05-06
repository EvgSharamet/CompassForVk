//
//  CompassService.swift
//  CompassForVk
//
//  Created by Евгения Шарамет on 06.05.2023.
//

import SwiftUI
import Combine
import CoreLocation

class CompassService: NSObject, ObservableObject, CLLocationManagerDelegate {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var degrees: Double = 0.0 {
        didSet {
            objectWillChange.send()
        }
    }
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.headingAvailable() {
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
        }
    }
}

// MARK: CLLocationManagerDelegate
extension CompassService {
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        degrees = -newHeading.magneticHeading
    }
}
