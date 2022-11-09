//
//  OrderProductTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/08.
//

import UIKit

class OrderProductTableViewCell: UITableViewCell {

    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var soldOutView: UIView!
    @IBOutlet var soldOutLabel: UILabel!
    
    @IBOutlet var productImageViewHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        productImageViewHeight.constant = 100
        soldOutView.layer.cornerRadius = productImageView.frame.height * 0.5
        productImageView.layer.cornerRadius = productImageView.frame.height * 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
