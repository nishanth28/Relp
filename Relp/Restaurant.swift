//
//  Restaurant.swift
//  Relp
//
//  Created by Nishanth P on 2/24/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit

class Restaurant: NSObject {
    
    var name : String?
    var lat : Double?
    var long : Double?
    var address : String?
    var open : Bool?
    var rating : Int?
    var price : Int?
    var website : URL?
   // var icon : String?
    
    init(name : String, lat : Double, long : Double, address : String, open : Bool, rating : Int, price : Int){
        
        self.name = name
        self.lat = lat
        self.long = long
        self.address = address
        self.open = open
        self.rating = rating
        self.price = price
        self.website = URL(string:"")
        //self.icon = icon
        
    }

}
