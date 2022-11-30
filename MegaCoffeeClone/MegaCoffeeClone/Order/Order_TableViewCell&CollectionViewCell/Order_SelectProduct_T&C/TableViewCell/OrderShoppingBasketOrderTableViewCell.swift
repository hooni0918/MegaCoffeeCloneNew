//
//  OrderShoppingBasketOrderTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/30.
//

import UIKit

class OrderShoppingBasketOrderTableViewCell: UITableViewCell {

    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var orderButton: UIButton!
    @IBOutlet var readyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
        orderButton.layer.cornerRadius = 10
        readyButton.layer.cornerRadius = 10
    }
    
    func configButton(isOn: Bool) {
        if isOn {
            readyButton.isHidden = true
        } else {
            orderButton.isHidden = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
