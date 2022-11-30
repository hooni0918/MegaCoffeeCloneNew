//
//  OrderShoppigBasketListTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/29.
//

import UIKit

protocol OrderShoppingBasketListTableViewCellDelegate {
    func deleteMenu(index: Int)
    func minusMenuCount(index: Int)
    func plusMenuCount(index: Int)
}

class OrderShoppingBasketListTableViewCell: UITableViewCell {

    @IBOutlet var menuImageView: UIImageView!
    @IBOutlet var menuNameLabel: UILabel!
    @IBOutlet var menuOptionLabel: UILabel!
    @IBOutlet var menuCountLabel: UILabel!
    @IBOutlet var menuTotalPriceLabel: UILabel!
    
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    
    var delegate: OrderShoppingBasketListTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapDeleteButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        delegate?.deleteMenu(index: button.tag)
        
    }
    
    @IBAction func tapMinusButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        delegate?.minusMenuCount(index: button.tag)
    }
    
    @IBAction func tapPlusButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        delegate?.plusMenuCount(index: button.tag)
    }
}
