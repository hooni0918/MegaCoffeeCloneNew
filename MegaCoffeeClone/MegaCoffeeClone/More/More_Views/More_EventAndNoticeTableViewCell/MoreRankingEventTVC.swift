//
//  MoreRankingEventTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//


import Foundation
import UIKit

class MoreRankingEventTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
       
        
        self.backgroundColor = .systemBrown
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
        
      }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
}

