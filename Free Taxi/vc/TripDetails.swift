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

class TripDetails: UIViewController, FloatingPanelControllerDelegate, CLLocationManagerDelegate {

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
    
    let view1: UIView = {
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = .black
        
        return view1
    }()
    
    
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
