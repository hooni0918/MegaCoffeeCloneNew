//
//  OrderMoreStoresButtonTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/09.
//

import UIKit

protocol OrderMoreStoresButtonTableViewCellDelegate {
    func fetchPagingProducts()
}

class OrderMoreStoresButtonTableViewCell: UITableViewCell {

    @IBOutlet var moreButton: UIButton!
    
    var delegate: OrderMoreStoresButtonTableViewCellDelegate?
    
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
