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
        title.font = .boldSystemFont(ofSize: 18)
        
        return title
    }()
    
    lazy var subTitleLabel: UILabel = {
       let sub = UILabel()
        
        sub.textColor = .label
        sub.font = .systemFont(ofSize: 15)
        
        return sub
    }()
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        
        self.backgroundColor = .systemGray3
        
        addSubView()
        layoutStackView()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
        
      }
    
    
    func addSubView() {
        self.contentView.addSubview(self.stackView)
        
        self.stackView.addArrangedSubview(self.titleLabel)
        self.stackView.addArrangedSubview(self.subTitleLabel)
    }
    
 
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            
        ])
    }
    
    

}

