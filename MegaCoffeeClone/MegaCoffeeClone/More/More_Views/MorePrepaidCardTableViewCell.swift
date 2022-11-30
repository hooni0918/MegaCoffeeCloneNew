//
//  MorePrepaidCardTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//

import Foundation
import UIKit


class MorePrepaidCardTableViewCell: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    let tableLabel : UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 15, weight: .regular)
            return label
        }()
    
    
    lazy var textView: UITextView = {
       let t = UITextView()
        
        
        
        
        return t
    }()
    
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        layout()
     
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
    
    
    func layout() {
        addSubview(tableLabel)

        
        tableLabel.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            self.tableLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.tableLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
             
             ])
    }
    

}
