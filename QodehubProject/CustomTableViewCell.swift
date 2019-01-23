//
//  CustomTableViewCell.swift
//  QodehubProject
//
//  Created by Ernest Gaisie on 23/01/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var orderIDLabel: UILabel!
    @IBOutlet var deliveryNameLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
