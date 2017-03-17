//
//  tabView.swift
//  Relp
//
//  Created by Nishanth P on 2/24/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit
import MapKit

class tabView: UIView {

    
    override func draw(_ rect: CGRect) {
        
        layer.cornerRadius = 10
        layer.masksToBounds = true

        }
    

}

class tabImage: UIImageView {
    
    
    override func awakeFromNib() {
        
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true

        
    }
        
}


class ResImage: UIImageView {
    
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        
    }
    
}


class mapView: MKMapView {
    
    override func draw(_ rect: CGRect) {
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        
    }
    
}

