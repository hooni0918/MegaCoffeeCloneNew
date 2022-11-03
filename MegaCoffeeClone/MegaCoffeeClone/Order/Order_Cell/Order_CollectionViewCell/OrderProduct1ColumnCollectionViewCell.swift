//
//  OrderProduct1ColumnCollectionViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/02.
//

import UIKit

class OrderProduct1ColumnCollectionViewCell: UICollectionViewCell {

    @IBOutlet var productImageView: UIImageView!
    
    @IBOutlet var soldOutView: UIView!
    @IBOutlet var soldOutLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        soldOutView.layer.cornerRadius = productImageView.frame.height / 2
        productImageView.layer.cornerRadius = productImageView.frame.height / 2
    }

}
