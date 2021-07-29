//
//  MapViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 25.07.21.
//

import UIKit
import MapKit
import CoreData

class MapViewController: BaseViewController,CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    
    let locationManager = CLLocationManager()
    var userLocation = CLLocation()
    var locations = [Location]()
    var firstOpened = Bool() 
    var rowSegue = false
    var rowLocation:Location?
    var tableVC: LocationViewController?
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        getLocations()
        addMapPins()
        
        mapView.showsUserLocation = true
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.addLongPressLocation(_:)))
        mapView.addGestureRecognizer(uilpgr)
        uilpgr.minimumPressDuration = 0.35
        
        firstOpened = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.black
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        navigationController?.isNavigationBarHidden = true
    }
    @IBAction func addLongPressLocation(_ sender: UILongPressGestureRecognizer) {
        
        if (sender.state == UIGestureRecognizer.State.began) {
            
            let touchPoint = sender.location(in: mapView)
            let newCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            
            let pressed = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            _ = addLocation(pressed, isUser: false)
        }
    }
    

    @IBAction func addYourLocation(_ sender: Any) {
        _ = addLocation(userLocation, isUser: true)
    }

    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        userLocation = locations[0]
        
        if firstOpened {
            let mapSpan:MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: 0.02,longitudeDelta: 0.02)
            var region = MKCoordinateRegion()
            
            if rowSegue {
                let location = self.rowLocation
                let lat = location?.latitude
                let long = location?.longitude
                let coordinate = CLLocationCoordinate2DMake(lat!, long!)
                region = MKCoordinateRegion.init(center: coordinate,span: mapSpan)
            }
            else {
                region = MKCoordinateRegion.init(center: userLocation.coordinate,span: mapSpan)
            }
            
            self.mapView.setRegion(region, animated: false)
            
            firstOpened = false
        }
    }
    
    func getPlacemark(_ cllocation:CLLocation, location:Location, isUser:Bool) {
        CLGeocoder().reverseGeocodeLocation(cllocation, completionHandler: { (placemarks, error ) in
            
            if error != nil || placemarks == nil || placemarks!.count == 0 {
                print(error ?? "Unknown error in geocoder")
                return
            }
            
            let place = placemarks![0] as CLPlacemark
            
            location.address = self.parseAddress(place)
            location.latitude = cllocation.coordinate.latitude
            location.longitude = cllocation.coordinate.longitude
            
            for each in self.locations {
                let x = location.latitude
                let y = each.latitude
                let latResult = fabs(x - y) < 0.0002
                
                let u = location.longitude
                let v = each.longitude
                let longResult = fabs(u - v) < 0.0002
                
                if latResult && longResult {
                    let context = getContext()
                    context.delete(location)
                    return
                }
            }
            
            saveContext()
            
            if(isUser) {
                self.tableVC?.tableView.reloadData()
                self.navigationController?.popViewController(animated: true)
            }
            
            let annotation = MKPointAnnotation()
            let lat = CLLocationDegrees(location.latitude)
            let long = CLLocationDegrees(location.longitude)
            annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            annotation.title = location.address
            self.mapView.addAnnotation(annotation)
        })
    }
    
    func parseAddress(_ place: CLPlacemark) -> String {
        var address = ""
        var locality = place.locality ?? ""
        var thoroughfare = place.thoroughfare ?? ""
        var subThoroughfare = place.subThoroughfare ?? ""
        
        // if all paramters are empty, only add country
        if subThoroughfare == "" && thoroughfare == "" && locality == "" {
            address = place.country ?? "No country or address found"
            return address
        }
        
        // add space after section if not empty
        if locality         != "" { locality += " " }
        if thoroughfare     != "" { thoroughfare += " " }
        if subThoroughfare  != "" { subThoroughfare += " " }
        
        address = "\(subThoroughfare)\(thoroughfare)\(locality)"
        return address
    }

    
    func addLocation(_ cllocation:CLLocation, isUser:Bool = false) -> Location {
        let location = Location(context: getContext())
        getPlacemark(cllocation, location: location, isUser: isUser)
        return location
    }
    
    func getLocations() {
        let context = getContext()
        
        do {
            locations = try context.fetch(Location.fetchRequest()) as! [Location]
        }
        catch {
            print("fetch error in Map View")
        }
    }
    
    // Add Map Pins in locations array
    func addMapPins() {
        for location in locations {
            let annotation = MKPointAnnotation()
            let address = location.address
            let lat = location.latitude
            let long = location.longitude
            
            annotation.coordinate = CLLocationCoordinate2DMake(lat, long)
            annotation.title = address
            self.mapView.addAnnotation(annotation)
        }
    }
    

}
