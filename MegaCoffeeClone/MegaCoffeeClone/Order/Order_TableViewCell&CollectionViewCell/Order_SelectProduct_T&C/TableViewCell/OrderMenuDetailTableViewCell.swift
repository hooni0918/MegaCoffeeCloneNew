//
//  OrderDetail1TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

class OrderMenuDetailTableViewCell: UITableViewCell {
    
    @IBOutlet var menuImageView: UIImageView!
    @IBOutlet var soldOutView: UIView!
    @IBOutlet var soldOutLabel: UILabel!
    @IBOutlet var menuNameLabel: UILabel!
    @IBOutlet var menuDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        soldOutView.layer.cornerRadius = soldOutView.frame.height / 2
        
    }

    func configSoldOutView(isSoldOut: Bool) {
        if isSoldOut {
            soldOutView.isHidden = false
            soldOutLabel.isHidden = false
        } else {
            soldOutView.isHidden = true
            soldOutLabel.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
