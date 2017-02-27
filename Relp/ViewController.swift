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

class ViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var open: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = restaurant!.name
        addMap()
        displayDetails()
        
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
    
    func displayDetails(){
        
        name.text = restaurant!.name
        distance.text = "..KM"
        open.text = "Yes"
        rating.text = "🌟"
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

