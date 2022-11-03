//
//  OrderProductCollectionViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/01.
//

import UIKit

class OrderProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var soldOutView: UIView!
    @IBOutlet var soldOutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        soldOutView.layer.cornerRadius = productImageView.frame.height / 2
        productImageView.layer.cornerRadius = productImageView.frame.height / 2
    }
}
