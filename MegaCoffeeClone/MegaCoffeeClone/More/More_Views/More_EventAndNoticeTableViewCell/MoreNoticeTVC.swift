//
//  MoreNoticeTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//

import Foundation
import UIKit

class MoreNoticeTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    lazy var titleLabel: UILabel = {
       let title = UILabel()
        
        title.textColor = .label
        title.numberOfLines = 0
        title.font = .systemFont(ofSize: 18, weight: .bold)
        
        return title
    }()
    
    lazy var subTitleLabel: UILabel = {
       let sub = UILabel()
        
        sub.textColor = .label
        sub.font = .systemFont(ofSize: 14, weight: .light)
        
        return sub
    }()
    
  
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        
        addSubView()
        layout()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
        
      }
    
    
    
    
    
    func addSubView() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.subTitleLabel)
    }
    
    func layout() {
        layoutTitleLabel()
        layoutSubTitleLabel()
    }
    
 
    func layoutTitleLabel() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
            
            
        ])
    }
    
    func layoutSubTitleLabel() {
        self.subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10)
            
            //self.subTitleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30)
            
        ])
    }

}
