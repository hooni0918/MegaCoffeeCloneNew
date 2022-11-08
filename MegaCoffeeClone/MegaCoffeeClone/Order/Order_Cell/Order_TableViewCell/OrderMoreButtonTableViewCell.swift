//
//  OrderMoreButtonTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/08.
//

import UIKit

protocol OrderMoreButtonTableViewCellDelegate {
    func fetchPagingProducts()
}

class OrderMoreButtonTableViewCell: UITableViewCell {

    @IBOutlet var moreButton: UIButton!
    
    var delegate: OrderMoreButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapMoreButton(_ sender: Any) {
        delegate?.fetchPagingProducts()
    }
}
