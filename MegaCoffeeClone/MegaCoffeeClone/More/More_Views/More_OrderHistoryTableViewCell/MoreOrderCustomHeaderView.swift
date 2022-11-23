//
//  OrderCustomHeaderView.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/23.
//


import Foundation
import UIKit

class MoreOrderCustomHeaderView: UITableViewHeaderFooterView {
    
    // MARK: [변수 선언]
    // week1
    lazy var week1Button: UIButton = {
        let week1 = UIButton(type: .system)
        
        week1.circle()
        week1.setTitleColor(UIColor.black, for: .normal)
        week1.tag = 1
        
        return week1
    }()
    
    // month1
    lazy var month1Button: UIButton = {
        let month1 = UIButton(type: .system)
        
        month1.circle()
        month1.setTitleColor(UIColor.black, for: .normal)
        month1.tag = 2
        
        return month1
        
    }()
    
    
    // month3
    lazy var month3Button: UIButton = {
        let month3 = UIButton(type: .system)
        
        month3.circle()
        month3.setTitleColor(UIColor.black, for: .normal)
        month3.tag = 3
        
        return month3
        
    }()
    
    // total
    lazy var totalButton: UIButton = {
        let total = UIButton(type: .system)
        
        total.circle()
        total.setTitleColor(UIColor.black, for: .normal)
        total.tag = 4
        
        return total
        
    }()
    
    
    
    // stackView
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }()
    
    
    
    
    
    
    // MARK: [Override]
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
            

        addSubView()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
    }
    
    
    
    
    // MARK: [Add View]
    func addSubView() {
        self.contentView.addSubview(self.stackView)

        self.stackView.addArrangedSubview(self.week1Button)
        self.stackView.addArrangedSubview(self.month1Button)
        self.stackView.addArrangedSubview(self.month3Button)
        self.stackView.addArrangedSubview(self.totalButton)
    }
    
    
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutStackView()
    }
    
    
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.7)
            
            ])
    }
    
  
}

// MARK: [UIButton]
extension UIButton {
    
    func circle() {
        self.layer.borderColor = UIColor.systemGray3.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
    }
    
}

