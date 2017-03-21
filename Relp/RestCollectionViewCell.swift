//
//  RestCollectionViewCollectionViewController.swift
//  Relp
//
//  Created by Nishanth P on 3/17/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit

class RestCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var restInformation: UILabel!
    @IBOutlet weak var bgColor: UIView!
    
//    var restaurant : Restaurant? {
//        
//        didSet{
//            self.updateUI()
//        }
//        
//    }
//    
//
//    private func updateUI()
//    {
//        if let restaurant = restaurant {
//            
//            featuredImageView.image = UIImage(named: "Rest.jpg")
//            restInformation.text = "Pizza Hut"
//            bgColor.backgroundColor = UIColor.red
//        }
//        else
//        {
//            featuredImageView.image = nil
//            restInformation.text = nil
//            bgColor.backgroundColor = nil
//            
//        }
//        
//    
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 5, height: 10)
        bgColor.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.clipsToBounds = false
        
    }

    
   
}
