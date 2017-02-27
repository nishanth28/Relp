//
//  RestTableCell.swift
//  Relp
//
//  Created by Nishanth P on 2/24/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit

class RestTableCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var relpImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var tabAlterView: tabView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
