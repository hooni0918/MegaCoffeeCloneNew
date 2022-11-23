//
//  OrderDetail2TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

protocol OrderMenuDetail2TableViewCellDelegate {
    func changeSection1(row: Int, buttonIndex: Int)
}

class OrderMenuDetail2TableViewCell: UITableViewCell {

    @IBOutlet var optionTitleLabel: UILabel!
    @IBOutlet var optionButtons: [UIButton]!
    
    var row = 0
    var menuData: MenuModel2?
    
    var delegate: OrderMenuDetail2TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configOptionButton() {
        let count = menuData?.option[row].details.count ?? 0
        optionTitleLabel.text = menuData?.option[row].header
        
        for i in 0..<6 {
            if i >= count {
                optionButtons[i].isHidden = true
            } else {
                optionButtons[i].isHidden = false
                optionButtons[i].setTitle(menuData?.option[row].details[i].name, for: .normal)
                
                if menuData?.option[row].details[i].isSelect == true {
                    optionButtons[i].setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
                    optionButtons[i].tintColor = .black
                } else {
                    optionButtons[i].setImage(UIImage(systemName: "circle"), for: .normal)
                    optionButtons[i].tintColor = .lightGray
                }
            }
        }
    }
    
    
    
    @IBAction func tapOptionButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        let index = menuData?.option[row].details.firstIndex(where: {$0.isSelect == true}) ?? 0
        
        menuData?.option[row].details[index].isSelect = false
        menuData?.option[row].details[button.tag].isSelect = true
            
        optionButtons[index].setImage(UIImage(systemName: "circle"), for: .normal)
        optionButtons[index].tintColor = .lightGray
        optionButtons[button.tag].setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
        optionButtons[button.tag].tintColor = .black
        
        delegate?.changeSection1(row: row, buttonIndex: button.tag)
    }
}
