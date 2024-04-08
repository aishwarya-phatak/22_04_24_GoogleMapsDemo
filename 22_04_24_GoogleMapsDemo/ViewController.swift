//
//  ViewController.swift
//  22_04_24_GoogleMapsDemo
//
//  Created by Vishal Jagtap on 03/04/24.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var googleMapView: GMSMapView!
    var punePosition = CLLocationCoordinate2D(
        latitude: 18.5204,
        longitude: 73.8567)
    var puneMarker : GMSMarker?
    var gmsCameraPosition : GMSCameraPosition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleMapView.delegate = self
        initializeGoogleMaps()
        initializeMarker(position: punePosition)
        initializeCameraSettings(position: punePosition)
        drawCircle(position: punePosition)
        drawPolygon()
        drawPolyline()
    }
    
    func initializeGoogleMaps(){
        googleMapView.isIndoorEnabled = true
        googleMapView.isTrafficEnabled = true
        googleMapView.isBuildingsEnabled = true
        googleMapView.isMyLocationEnabled = true
        googleMapView.settings.myLocationButton = true
        googleMapView.settings.rotateGestures = true
        googleMapView.settings.compassButton = true
        googleMapView.settings.zoomGestures = true
        googleMapView.settings.tiltGestures = true
        googleMapView.settings.scrollGestures = true
        googleMapView.mapType = .normal
    }
    
    func initializeMarker(position : CLLocationCoordinate2D){
        puneMarker = GMSMarker(position: position)
        puneMarker?.isDraggable = true
        puneMarker?.rotation = 45.0
        puneMarker?.title = "Pune"
        puneMarker?.zIndex = 20
//        puneMarker?.icon = UIImage(named: "")
        puneMarker?.map = googleMapView //imp
    }
    
    func initializeCameraSettings(position : CLLocationCoordinate2D){
        gmsCameraPosition = GMSCameraPosition(target: position, zoom: 20.0)
        googleMapView.camera = gmsCameraPosition!
    }
    
    func drawCircle(position : CLLocationCoordinate2D){
        var gmsCircle = GMSCircle(position: position, radius: 10.0)
        gmsCircle.fillColor = .brown
        gmsCircle.strokeColor = .black
        gmsCircle.strokeWidth = 7.0
        gmsCircle.title = "Pune"
        gmsCircle.zIndex = 10
        gmsCircle.map = googleMapView       //drawing a circle on map
    }
    
    func drawPolygon(){
        var gmsPolygonPath = GMSMutablePath()
        gmsPolygonPath.add(CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777))
        gmsPolygonPath.add(CLLocationCoordinate2D(latitude: 23.2599, longitude: 77.4126))
        gmsPolygonPath.add(CLLocationCoordinate2D(latitude: 18.1124, longitude: 79.0193))
        gmsPolygonPath.add(CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946))
        
        let gmsPolygon  = GMSPolygon(path: gmsPolygonPath)
        gmsPolygon.strokeWidth = 10.0
        gmsPolygon.strokeColor = .blue
        gmsPolygon.fillColor = .cyan
        gmsPolygon.zIndex = 20
        gmsPolygon.map = googleMapView
    }
    
    func drawPolyline(){
        var gmsPolyLinePath = GMSMutablePath()
        gmsPolyLinePath.add(CLLocationCoordinate2D(latitude: 20.9320, longitude: 77.7523))
        gmsPolyLinePath.add(CLLocationCoordinate2D(latitude: 20.7453, longitude: 78.6022))
        gmsPolyLinePath.add(CLLocationCoordinate2D(latitude: 21.1458, longitude: 79.0882))
        gmsPolyLinePath.add(CLLocationCoordinate2D(latitude: 19.9615, longitude: 79.2961))
        gmsPolyLinePath.add(CLLocationCoordinate2D(latitude: 20.9320, longitude: 77.7523))
        
        let gmsPolyline = GMSPolyline(path: gmsPolyLinePath)
        gmsPolyline.strokeColor = .brown
        gmsPolyline.strokeWidth = 10.0
        gmsPolyline.map = googleMapView
    }
}
