//
//  tabView.swift
//  Relp
//
//  Created by Nishanth P on 2/24/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit
import MapKit

@IBDesignable class tabView: UIView {
    
    @IBInspectable var fillColor : UIColor = UIColor.clear {
        
        didSet {
            layer.backgroundColor = fillColor.cgColor
        }
        
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        
        didSet{
            
            layer.borderColor = borderColor.cgColor
            
        }
        
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        
        didSet{
            
            layer.borderWidth = borderWidth
            
        }
        
        
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        
        didSet{
            
            layer.cornerRadius = cornerRadius
            
        }
        
    }
    
    @IBInspectable var maskToBounds : Bool = true {
        
        didSet{
            
            layer.masksToBounds = maskToBounds
            
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        layer.backgroundColor = UIColor(red: 178/255, green: 223/255, blue: 219/255, alpha: 1.0).cgColor
        
    }
   
}

@IBDesignable class tabImage: UIImageView {
    
    
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        
        didSet{
            
            layer.borderColor = borderColor.cgColor
            
        }
        
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        
        didSet{
            
            layer.borderWidth = borderWidth
            
        }
        
        
    }
    

    
    override func awakeFromNib() {
        
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true

        
    }
        
}


@IBDesignable class ResImage: UIImageView {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        
        didSet{
            
            layer.borderColor = borderColor.cgColor
            
        }
        
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        
        didSet{
            
            layer.borderWidth = borderWidth
            
        }
        
        
    }
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        
    }
    
}


@IBDesignable class mapView: MKMapView {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        
        didSet{
            
            layer.borderColor = borderColor.cgColor
            
        }
        
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        
        didSet{
            
            layer.borderWidth = borderWidth
            
        }
        
        
    }

    
    override func draw(_ rect: CGRect) {
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        
    }
    
}

