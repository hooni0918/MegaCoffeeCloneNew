//
//  OrderDetail2TableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

protocol OrderMenuDetail2TableViewCellDelegate {
    func changeSection2(row: Int, buttonIndex: Int)
    func updateCount(row: Int, index: Int, count: Int)
}

class OrderMenuDetail2TableViewCell: UITableViewCell {

    @IBOutlet var optionTitleLabel: UILabel!
    @IBOutlet var optionButtons: [UIButton]!
    
    @IBOutlet var countStackViews: [UIStackView]!
    
    @IBOutlet var countLabels: [UILabel]!
    
    var row = 0
    var totalCount = 0
    var selectedCount = 0
    var menuData: MenuModel2?
    var isEssential = false
    
    var delegate: OrderMenuDetail2TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        optionButtons[0].layoutIfNeeded()
        optionButtons[1].layoutIfNeeded()
        optionButtons[2].layoutIfNeeded()
        optionButtons[3].layoutIfNeeded()
        optionButtons[4].layoutIfNeeded()
        optionButtons[5].layoutIfNeeded()
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
                if menuData?.option[row].details[i].soldOut ?? false {
                    optionButtons[i].setTitle("(품절)\(menuData?.option[row].details[i].name ?? "")", for: .normal)
                    optionButtons[i].isUserInteractionEnabled = false
                } else {
                    optionButtons[i].setTitle(menuData?.option[row].details[i].name, for: .normal)
                }
               
                
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
        
        if isEssential {
            menuData?.option[row].details[button.tag].isSelect.toggle()
            
            if let isSelected = menuData?.option[row].details[button.tag].isSelect, isSelected == false {
                optionButtons[button.tag].setImage(UIImage(systemName: "circle"), for: .normal)
                optionButtons[button.tag].tintColor = .lightGray
                countStackViews[button.tag].isHidden = true
                selectedCount -= 1
            } else {
                optionButtons[button.tag].setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
                optionButtons[button.tag].tintColor = .black
                countLabels[button.tag].text = "\(menuData?.option[row].details[button.tag].count ?? 0)"
                countStackViews[button.tag].isHidden = false
                selectedCount += 1
                
            }

            delegate?.changeSection2(row: row, buttonIndex: button.tag)
            
        } else {
            let index = menuData?.option[row].details.firstIndex(where: {$0.isSelect == true}) ?? 0
            
            menuData?.option[row].details[index].isSelect = false
            menuData?.option[row].details[button.tag].isSelect = true
                
            optionButtons[index].setImage(UIImage(systemName: "circle"), for: .normal)
            optionButtons[index].tintColor = .lightGray
            optionButtons[button.tag].setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
            optionButtons[button.tag].tintColor = .black
            
            delegate?.changeSection2(row: row, buttonIndex: button.tag)
        }
    }
    
    @IBAction func tapMinusButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let count = Int(countLabels[button.tag].text ?? "") ?? 0
        
        if count > 1 {
            countLabels[button.tag].text = "\(count - 1)"
            selectedCount -= 1
        }
        delegate?.updateCount(row: row, index: button.tag, count: Int(countLabels[button.tag].text ?? "") ?? 0)
    }
    
    @IBAction func tapPlusButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let count = Int(countLabels[button.tag].text ?? "") ?? 0
        
        if selectedCount == totalCount {
            print("그만")
        } else {
            countLabels[button.tag].text = "\(count + 1)"
            selectedCount += 1
        }
        delegate?.updateCount(row: row, index: button.tag, count: Int(countLabels[button.tag].text ?? "") ?? 0)
    }
}
