//
//  SomeMainViewController.swift
//  Free Taxi
//
//  Created by Fazlik Ziyaev on 22/12/21.
//

import UIKit
import GoogleMaps
import CoreLocation
import FloatingPanel
import SwiftyJSON


class TripDetails: UIViewController, FloatingPanelControllerDelegate, CLLocationManagerDelegate {

    let googleAPIKey = "AIzaSyC4ne_L_e7ahdRg8mHTCc12dRA5leDCsHg"
    
    let backBtn: UIButton = {
        let backBtn = UIButton()
//        backBtn.setTitle("Hello", for: .normal)
//        backBtn.setTitleColor(.white, for: .normal)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(named: "btn_back_circle"), for: .normal)
        backBtn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        
        return backBtn
    }()
    
    @objc func backBtnPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    let mapView: GMSMapView = {
        let mapView = GMSMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        
        locationManager.delegate = self
        mapView.camera = GMSCameraPosition(
            target: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0),
            zoom: 13,
            bearing: 0,
            viewingAngle: 0)
        
        let fps = FloatingPanelController()
        
        fps.delegate = self
        
        let tripPanelVC = TripPanel()
        
        fps.set(contentViewController: tripPanelVC)
        
        fps.addPanel(toParent: self)
        
        drawRoute()
    }
    
    func drawRoute(){
        // current location
        let sourceLocation = "\(41.371246337890625),\(69.28838647065724)"
        print(sourceLocation)
        
        // April restaurant
        let destinationLocation = "\(41.3553606),\(69.3050277)"
        print(destinationLocation)
        
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(sourceLocation)&destination=\(destinationLocation)&mode=driving&key=\(self.googleAPIKey)"
        
        
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if let safeData = data {
                let json = JSON(safeData)
                
                do{
                    let routes = json["routes"].array
                    self.mapView.clear()
                    
                    for route in routes!
                    {
                        let points = route.dictionary?["overview_polyline"]?.dictionaryObject?["points"]
                        let path = GMSPath.init(fromEncodedPath: points! as! String)
                        let polyline = GMSPolyline.init(path: path)
                        polyline.strokeWidth = 3
                        polyline.strokeColor = .systemGreen
                        
                        let bounds = GMSCoordinateBounds(path: path!)
                        
                        DispatchQueue.main.async {
                            self.mapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 30.0))
                            
                            polyline.map = self.mapView
                            self.addMarkers()
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    func addMarkers(){
        
        let lat = locationManager.location?.coordinate.latitude ?? 0.0
        let long = locationManager.location?.coordinate.longitude ?? 0.0
        
        let sourceMarker = GMSMarker()
        sourceMarker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        sourceMarker.title = "Mega"
        sourceMarker.snippet = "Mega"
        sourceMarker.map = self.mapView
        
        
        let destinationMarker = GMSMarker()
        destinationMarker.position = CLLocationCoordinate2D(latitude: 41.3553606 , longitude: 69.3050277)
        destinationMarker.title = "April"
        destinationMarker.snippet = "April"
        destinationMarker.map = self.mapView
    }
    
    func setupLayouts(){
        view.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(backBtn)
        backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
}
