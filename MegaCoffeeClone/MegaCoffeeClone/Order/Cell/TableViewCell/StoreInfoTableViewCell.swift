//
//  StoreInfoTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/05.
//

import UIKit

class StoreInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    @IBOutlet var storeImageView: UIImageView!
    @IBOutlet var storeOffView: UIView!
    @IBOutlet var storeOffLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        storeImageView.layer.cornerRadius = 0.5 * (storeImageView.image?.size.width ?? 0.0)
        storeOffView.layer.cornerRadius = 0.5 * (storeImageView.image?.size.width ?? 0.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
