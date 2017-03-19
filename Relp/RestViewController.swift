//
//  RestViewController.swift
//  Relp
//
//  Created by Nishanth P on 3/17/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RestaurantCollectionViewID"

class RestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var restCollectionView: UICollectionView!
    
    var restaurant : [String] = ["Darios","Pizza","Dominos","HSM","Tops Diner","Copper Chimney","La famina","SpanishPavillion"]
    var resImage: [String] = ["Res2.jpeg","Res3.jpg","Res4.jpg","Res6.jpg","Res8.jpeg","Res9.jpeg","Res10.jpeg","restaurant1.jpg"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        coursalEffectCalculation()
        
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RestCollectionViewCell
        
        let mod = indexPath.row % 8
        
        cell.featuredImageView.image = UIImage(named:"\(resImage[mod])")
        cell.restInformation.text = restaurant[mod]
        
        return cell
    }
    
    
    func coursalEffectCalculation(){
        
        let screenSize = UIScreen.main.bounds.size
        let cellScaling : CGFloat = 0.6
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)

        let insetX = (view.bounds.width - cellWidth)/2.0
        let insetY = (view.bounds.height - cellHeight)/2.0
        
        let layout = restCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth , height:cellHeight)
        restCollectionView?.contentInset = UIEdgeInsets(top:insetY,left:insetX,bottom: insetY, right:insetX)
        
    }
    

   
}


extension RestViewController : UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.restCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludedSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludedSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x:roundedIndex * cellWidthIncludedSpacing - scrollView.contentInset.left, y:-scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
        
        
        
    }
        
    
    
}
