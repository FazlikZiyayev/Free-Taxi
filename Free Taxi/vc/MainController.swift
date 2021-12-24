//
//  ViewController.swift
//  Free Taxi
//
//  Created by Fazlik Ziyaev on 17/12/21.
//

import UIKit
import SideMenu
import GoogleMaps
import CoreLocation

class MainController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var adressBlock: UIView!
    
    var sideMenu: SideMenuNavigationController?
    let locationManager = CLLocationManager()
    let googleAPIKey = "AIzaSyDgLFdyaVq1I_cwfKb1V5F2N18_KWt1I50"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNext.layer.cornerRadius = 15
        btnNext.layer.maskedCorners = .layerMaxXMaxYCorner
        
        locationManager.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: MenuList())
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        sideMenu?.menuWidth = view.frame.width * 0.8
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        adressBlock.layer.cornerRadius = adressBlock.frame.height / 6.0
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    

    
    @IBAction func menuBynPressed(_ sender: UIButton) {
        sideMenu?.leftSide = true
        present(sideMenu! , animated: true)
    }
    
    // Setting map to current location
    @IBAction func locationBtnPressed(_ sender: UIButton) {
        
        mapView.camera = GMSCameraPosition(
            target: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0),
            zoom: 13,
            bearing: 0,
            viewingAngle: 0)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0 )
        marker.title = "Hey, hi"
        marker.snippet = "Hey I am here!"
        
        marker.map = mapView
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)) { response, error in
            let address = response?.firstResult()
            
            if let safeDistrict = address?.subLocality,
               let safeStreet = address?.thoroughfare {
                
                let correctedAddress = "\(safeDistrict), \(safeStreet)"
                
                DispatchQueue.main.async {
                    self.currentLocation.text = correctedAddress
                }
            }
        }
        
        
        
        // Authorize user
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .authorizedAlways:
                return
                
            case .authorizedWhenInUse:
                return
                
            case .denied:
                return
                
            case .restricted:
                locationManager.requestWhenInUseAuthorization()
                
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                
            default:
                locationManager.requestWhenInUseAuthorization()
            }
        }
    }
}
