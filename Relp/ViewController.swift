//
//  ViewController.swift
//  Relp
//
//  Created by Nishanth P on 2/23/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit
import MapKit

var api = "AIzaSyAZzPfNO8KSatKBRCYaFUjL8WwdcX-ugbk"

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var open: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var restaurant: Restaurant?
    var locManager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = restaurant!.name
        addMap()
        displayDetails()
        addGeoLoc()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addMap(){
     
        let lat = restaurant!.lat!
        let long = restaurant!.long!
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01,0.01)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat,long)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location,span)
        
        mapView.setRegion(region,animated:true)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = restaurant!.name!
        annotation.subtitle = restaurant!.address!
        
        mapView.addAnnotation(annotation)
  
    }
    
    func addGeoLoc(){
        
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestAlwaysAuthorization()
        locManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
    }
    
    func displayDetails(){
        
        name.text = restaurant!.name
        distance.text = "..KM"
        displayOpen(openDisp: restaurant!.open!)
        rating.text = displayRating(rating: restaurant!.rating!)
        
    }
    
    func displayRating(rating:Int) -> String {
    
        var ratingStars: String?
        
        switch rating {
            
            case 0:
                ratingStars = ""
            case 1:
                ratingStars = "🌟"
            case 2:
                ratingStars = "🌟🌟"
            case 3:
                ratingStars = "🌟🌟🌟"
            case 4:
                ratingStars = "🌟🌟🌟🌟"
            case 5:
                ratingStars = "🌟🌟🌟🌟🌟"
        
            default:
                ratingStars = ""
    
  
        }
         return ratingStars!
    }
    
    func displayOpen(openDisp:Bool){
        
        if openDisp{
            
            open.text = "Open"
            open.textColor = UIColor.green
            
        }else{
            
            open.text = "Closed"
            open.textColor = UIColor.red
            
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

