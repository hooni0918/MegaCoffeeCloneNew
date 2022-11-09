//
//  GiftCategoryCollectionViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/05.
//

import UIKit

class GiftCategoryCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var categoryView: UIView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryView.layer.cornerRadius = 22
        categoryView.layer.borderWidth = 1
        categoryView.layer.borderColor = UIColor.lightGray.cgColor
        categoryView.backgroundColor = UIColor.white
        categoryLabel.font = .boldSystemFont(ofSize: 18)
        categoryLabel.textColor = UIColor.lightGray
    }
    
   
    
    
}
