//
//  CategoryCollectionViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/01.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    
}
