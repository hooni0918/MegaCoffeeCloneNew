//
//  GiftPaymentButtonTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/30.
//

import UIKit

class GiftPaymentButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var paymentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        paymentButton.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func moreButtonClicked(_ sender: Any) {
        if moreButton.currentImage == UIImage(systemName: "chevron.down") {
            moreButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            
        } else {
            moreButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            
        }
    }
    
}
