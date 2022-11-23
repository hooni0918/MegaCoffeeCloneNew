//
//  OrderDetail4TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

protocol OrderMenuDetail4TableViewCellDelegate {
    func changeSection3(index: Int)
}

class OrderMenuDetail4TableViewCell: UITableViewCell {

    var delegate: OrderMenuDetail4TableViewCellDelegate?
    
    @IBOutlet var menuImageView1: UIImageView!
    @IBOutlet var menuImageView2: UIImageView!
    @IBOutlet var menuImageView3: UIImageView!
    
    @IBOutlet var menuNameLabel1: UILabel!
    @IBOutlet var menuNameLabel2: UILabel!
    @IBOutlet var menuNameLabel3: UILabel!
    
    @IBOutlet var menuPriceLabel1: UILabel!
    @IBOutlet var menuPriceLabel2: UILabel!
    @IBOutlet var menuPriceLabel3: UILabel!
    
    @IBOutlet var menuSelectButton1: UIButton!
    @IBOutlet var menuSelectButton2: UIButton!
    @IBOutlet var menuSelectButton3: UIButton!
    
    @IBOutlet var sumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func tapMenuSelectButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        recommendMenus[button.tag].isSelect.toggle()
        
        if recommendMenus[button.tag].isSelect {
            button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            button.tintColor = .black
        } else {
            button.setImage(UIImage(systemName: "circle"), for: .normal)
            button.tintColor = .systemGray
        }
        delegate?.changeSection3(index: button.tag)
    }
    
    
    @IBAction func tapDoneButton(_ sender: Any) {
        
    
    }
}
