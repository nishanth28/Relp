//
//  TableViewCell.swift
//  Relp
//
//  Created by Nishanth P on 2/24/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var restImage: UIImageView!
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
