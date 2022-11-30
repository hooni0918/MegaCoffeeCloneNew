//
//  OrderDetail4TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

protocol OrderMenuDetail4TableViewCellDelegate {
    func changeSection4(index: Int)
    func putShoppingBasket()
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
    
    @IBOutlet var doneButtonAndShoppingButtonStackView: UIStackView!

    @IBOutlet var doneButton: UIButton!
    @IBOutlet var shoppingbasketButton: UIButton!
    @IBOutlet var soldOutButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        doneButton.layer.cornerRadius = 10
        shoppingbasketButton.layer.cornerRadius = 10
        soldOutButton.layer.cornerRadius = 10
    }
    
    func configBottomButton(isSoldOut: Bool) {
        if isSoldOut {
            doneButtonAndShoppingButtonStackView.isHidden = true
            
        } else {
            soldOutButton.isHidden = true
            
        }
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
        delegate?.changeSection4(index: button.tag)
    }
    
    
    @IBAction func tapDoneButton(_ sender: Any) {
        
    
    }
    
    @IBAction func tapShoppingBasketButton(_ sender: Any) {
        // 장바구니에 담기만 하면 됨
        delegate?.putShoppingBasket()
    }
}
