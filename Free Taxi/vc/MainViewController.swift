//
//  MainViewController.swift
//  Free Taxi
//
//  Created by Fazlik Ziyaev on 24/12/21.
//

import UIKit
import SideMenu
import GoogleMaps
import CoreLocation
import SwiftyJSON
import Lottie

// Main part
//lottieView.play(fromFrame: 1, toFrame: 10, loopMode: .playOnce)


class MainViewController: UIViewController {
    
    var sideMenu: SideMenuNavigationController?
    let locationManager = CLLocationManager()
    let googleAPIKey = "AIzaSyC4ne_L_e7ahdRg8mHTCc12dRA5leDCsHg"
    

    let mapView: GMSMapView = {
        let mapView = GMSMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    let btnShowMenu: UIButton = {
        let btnShowMenu = UIButton()
        btnShowMenu.translatesAutoresizingMaskIntoConstraints = false
        btnShowMenu.setImage(UIImage(named: "btn_info"), for: .normal)
        
        btnShowMenu.addTarget(self, action: #selector(btnShowMenuPressed), for: .touchUpInside)
  
        return btnShowMenu
    }()
    
    let mapPinAnimated: AnimationView = {
        let mapPinAnimated: AnimationView = .init(name: "mapPin")
        mapPinAnimated.loopMode = .loop
        mapPinAnimated.translatesAutoresizingMaskIntoConstraints = false

        return mapPinAnimated
    }()
    
    let addressBlock: UIView = {
        let addressBlock = UIView()
        addressBlock.translatesAutoresizingMaskIntoConstraints = false
        addressBlock.backgroundColor = .white
        
        return addressBlock
    }()
    
    let addressInfoView: UIView = {
        let addressInfoView = UIView()
        addressInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        return addressInfoView
    }()
    
    let line: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .systemGray4
        
        return line
    }()
    
    let fromInfoView: UIView = {
        let fromInfoView = UIView()
        fromInfoView.translatesAutoresizingMaskIntoConstraints = false
        fromInfoView.backgroundColor = UIColor(named: "from_info_view")
        
        return fromInfoView
    }()
    
    let whereInfoView: UIView = {
        let whereInfoView = UIView()
        whereInfoView.translatesAutoresizingMaskIntoConstraints = false
        whereInfoView.backgroundColor = .systemGray6
        
        return whereInfoView
    }()
    
    let fromImage: UIImageView = {
        let fromImage = UIImageView(image: UIImage(named: "light_red_icon"))
        fromImage.translatesAutoresizingMaskIntoConstraints = false
        
        return fromImage
    }()
    
    let whereImage: UIImageView = {
        let whereImage = UIImageView(image: UIImage(named: "where_icon"))
        whereImage.translatesAutoresizingMaskIntoConstraints = false
        
        return whereImage
    }()
    
    let fromLabel: UILabel = {
        let fromLabel = UILabel()
        fromLabel.translatesAutoresizingMaskIntoConstraints = false
        fromLabel.text = "5a улица Асадуллы Ходжаева"
        fromLabel.textColor = .lightGray
        fromLabel.font = .boldSystemFont(ofSize: 15)
        
        return fromLabel
    }()
    
    let whereLabel: UILabel = {
        let whereLabel = UILabel()
        whereLabel.translatesAutoresizingMaskIntoConstraints = false
        whereLabel.text = "Куда?"
        whereLabel.textColor = .black
        whereLabel.font = .systemFont(ofSize: 16)
        
        return whereLabel
    }()
    
    let btnNext: UIButton = {
        let btnNext = UIButton()
        btnNext.translatesAutoresizingMaskIntoConstraints = false
        btnNext.setImage(UIImage(named: "btn_next"), for: .normal)
        btnNext.backgroundColor = .systemGray5
        
        return btnNext
    }()
    
    let btnMyLocation: UIButton = {
        let btnMyLocation = UIButton()
        btnMyLocation.translatesAutoresizingMaskIntoConstraints = false
        btnMyLocation.setImage(UIImage(named: "btn_my_location"), for: .normal)
        btnMyLocation.backgroundColor = .clear
        
        btnMyLocation.addTarget(self, action: #selector(btnMyLocationPressed), for: .touchUpInside)
        
        return btnMyLocation
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        mapView.delegate = self
        
        
        setupSideMenu()
        setupLayouts()
        
    }


    @objc func btnMyLocationPressed(){
        mapView.camera = GMSCameraPosition(
            target: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0),
            zoom: 13,
            bearing: 0,
            viewingAngle: 0)
        
        // crearing marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0 )
        marker.title = "Hey, hi"
        marker.snippet = "Hey I am here!"
        
        marker.map = mapView
        
        // getting address from lat and long
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)) { response, error in
            let address = response?.firstResult()
            
            if let safeDistrict = address?.subLocality,
               let safeStreet = address?.thoroughfare {
                
                let correctedAddress = "\(safeDistrict), \(safeStreet)"
                
                DispatchQueue.main.async {
                    self.fromLabel.text = correctedAddress
                    print(correctedAddress)
                }
            }
        }
    }
    
    @objc func btnShowMenuPressed(){
        sideMenu?.leftSide = true
        present(sideMenu! , animated: true)
    }
    
    func setupSideMenu(){
        sideMenu = SideMenuNavigationController(rootViewController: MenuList())
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        sideMenu?.menuWidth = view.frame.width * 0.8
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    func setupLayouts(){
        
        view.backgroundColor = .white
        
        view.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        view.addSubview(btnShowMenu)
        btnShowMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        btnShowMenu.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        btnShowMenu.widthAnchor.constraint(equalToConstant: 60).isActive = true
        btnShowMenu.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        // map pin
        view.addSubview(mapPinAnimated)
        mapPinAnimated.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mapPinAnimated.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        view.addSubview(addressBlock)
        addressBlock.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        addressBlock.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        addressBlock.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        addressBlock.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        addressBlock.layer.cornerRadius = 12
        addressBlock.layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
        
        view.addSubview(btnMyLocation)
        btnMyLocation.bottomAnchor.constraint(equalTo: addressBlock.topAnchor).isActive = true
        btnMyLocation.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        btnMyLocation.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btnMyLocation.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        addressBlock.addSubview(addressInfoView)
        addressInfoView.topAnchor.constraint(equalTo: addressBlock.topAnchor, constant: 20).isActive = true
        addressInfoView.leftAnchor.constraint(equalTo: addressBlock.leftAnchor, constant: 20).isActive = true
        addressInfoView.rightAnchor.constraint(equalTo: addressBlock.rightAnchor, constant: -20).isActive = true
        addressInfoView.bottomAnchor.constraint(equalTo: addressBlock.bottomAnchor, constant: -20).isActive = true
        
        addressInfoView.addSubview(line)
        line.centerYAnchor.constraint(equalTo: addressInfoView.centerYAnchor).isActive = true
        line.leftAnchor.constraint(equalTo: addressInfoView.leftAnchor).isActive = true
        line.rightAnchor.constraint(equalTo: addressInfoView.rightAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addressInfoView.addSubview(fromInfoView)
        fromInfoView.topAnchor.constraint(equalTo: addressInfoView.topAnchor).isActive = true
        fromInfoView.leftAnchor.constraint(equalTo: addressInfoView.leftAnchor).isActive = true
        fromInfoView.rightAnchor.constraint(equalTo: addressInfoView.rightAnchor).isActive = true
        fromInfoView.bottomAnchor.constraint(equalTo: line.topAnchor).isActive = true
        fromInfoView.layer.cornerRadius = 20
        fromInfoView.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
        
        addressInfoView.addSubview(whereInfoView)
        whereInfoView.topAnchor.constraint(equalTo: line.bottomAnchor).isActive = true
        whereInfoView.leftAnchor.constraint(equalTo: addressInfoView.leftAnchor).isActive = true
        whereInfoView.rightAnchor.constraint(equalTo: addressInfoView.rightAnchor).isActive = true
        whereInfoView.bottomAnchor.constraint(equalTo: addressInfoView.bottomAnchor).isActive = true
        whereInfoView.layer.cornerRadius = 20
        whereInfoView.layer.maskedCorners = [.layerMinXMaxYCorner , .layerMaxXMaxYCorner]
        
        fromInfoView.addSubview(fromImage)
        fromImage.centerYAnchor.constraint(equalTo: fromInfoView.centerYAnchor).isActive = true
        fromImage.leftAnchor.constraint(equalTo: fromInfoView.leftAnchor, constant: 5).isActive = true
        fromImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        fromImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        fromInfoView.addSubview(fromLabel)
        fromLabel.centerYAnchor.constraint(equalTo: fromInfoView.centerYAnchor).isActive = true
        fromLabel.leftAnchor.constraint(equalTo: fromImage.rightAnchor, constant: 5).isActive = true
        fromLabel.rightAnchor.constraint(equalTo: fromInfoView.rightAnchor, constant: 5).isActive = true
        
        whereInfoView.addSubview(whereImage)
        whereImage.centerYAnchor.constraint(equalTo: whereInfoView.centerYAnchor).isActive = true
        whereImage.leftAnchor.constraint(equalTo: whereInfoView.leftAnchor, constant: 5).isActive = true
        whereImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        whereImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        whereInfoView.addSubview(whereLabel)
        whereLabel.centerYAnchor.constraint(equalTo: whereImage.centerYAnchor).isActive = true
        whereLabel.leftAnchor.constraint(equalTo: whereImage.rightAnchor, constant: 5).isActive = true
        whereLabel.rightAnchor.constraint(equalTo: whereInfoView.rightAnchor, constant: 5).isActive = true
        
        whereInfoView.addSubview(btnNext)
        btnNext.topAnchor.constraint(equalTo: whereInfoView.topAnchor).isActive = true
        btnNext.rightAnchor.constraint(equalTo: whereInfoView.rightAnchor).isActive = true
        btnNext.bottomAnchor.constraint(equalTo: whereInfoView.bottomAnchor).isActive = true
        btnNext.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btnNext.layer.cornerRadius = 15
        btnNext.layer.maskedCorners = .layerMaxXMaxYCorner
        
    }
}

extension MainViewController: CLLocationManagerDelegate {
    
    // works when error occurs
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    // request for user for permission about location
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

extension MainViewController: GMSMapViewDelegate {
    
    // gives center of map when stops sliding map
    func mapView(_ mapView: GMSMapView, idleAt cameraPosition: GMSCameraPosition) {
        let geocoder = GMSGeocoder()
        
        let centerLat = mapView.projection.coordinate(for: mapView.center).latitude
        let centerLong = mapView.projection.coordinate(for: mapView.center).longitude
        
        geocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: centerLat , longitude: centerLong)) { response, error in
            let address = response?.firstResult()
            
            if let safeDistrict = address?.subLocality,
               let safeStreet = address?.thoroughfare {
                
                let correctedAddress = "\(safeDistrict), \(safeStreet)"
                
                DispatchQueue.main.async {
                    self.whereLabel.text = correctedAddress
                    print(correctedAddress)
                }
            }
        }
        
        // works when user stops sliding the map
        mapPinAnimated.play(fromFrame: 110, toFrame: 130, loopMode: .playOnce, completion: nil)
        print("Stopped sliding!")
      }
    
    // works when user starts sliding the map
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        mapPinAnimated.play(fromFrame: 0, toFrame: 28, loopMode: .playOnce, completion: nil)
        
        print("Started sliding")
    }
    
    // works while sliding
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        mapPinAnimated.play(fromFrame: 29, toFrame: 109, loopMode: .loop, completion: nil)
        
        print("Slidiiiing...")
    }
    
}
