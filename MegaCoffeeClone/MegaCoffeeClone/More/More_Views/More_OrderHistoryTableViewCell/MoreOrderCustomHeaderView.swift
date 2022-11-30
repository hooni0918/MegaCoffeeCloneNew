//
//  OrderCustomHeaderView.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/23.
//


import Foundation
import UIKit

class MoreOrderCustomHeaderView: UITableViewHeaderFooterView {
    
    
    
    // week1
    lazy var week1Button: UIButton = {
        let week1 = UIButton(type: .system)
        
        week1.colorSetting()
        
        week1.addTarget(self, action: #selector(week1ButtonTapped(_sender:)), for: .touchUpInside)
        
        week1.tag = 1
        
        
        return week1
    }()
    
    
    // month1
    lazy var month1Button: UIButton = {
        let month1 = UIButton(type: .system)
        
        month1.noneSetting()
        
        month1.addTarget(self, action: #selector(month1ButtonTapped(_sender:)), for: .touchUpInside)
        
        month1.tag = 2
        
        
        return month1
    }()
    
    
    // month3
    lazy var month3Button: UIButton = {
        let month3 = UIButton(type: .system)
        
        month3.noneSetting()
        
        month3.addTarget(self, action: #selector(month3ButtonTapped(_sender:)), for: .touchUpInside)
        
        month3.tag = 3
        
        
        return month3
    }()
    
    
    // total
    lazy var totalButton: UIButton = {
        let total = UIButton(type: .system)
        
        total.noneSetting()
        
        total.addTarget(self, action: #selector(totalButtonTapped(_sender:)), for: .touchUpInside)
        
        
        total.tag = 4
        
        return total
        
    }()
    
    
    
    // stackView
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 13
        
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
    
    
    
    
    
    // MARK: [Action]
    
    @objc func week1ButtonTapped(_sender: UIButton) {
        
        week1Button.colorSetting()
        
        month1Button.noneSetting()
        month3Button.noneSetting()
        totalButton.noneSetting()
    }
    
    
    @objc func month1ButtonTapped(_sender: UIButton) {
        
        week1Button.noneSetting()
        
        month1Button.colorSetting()
        
        month3Button.noneSetting()
        totalButton.noneSetting()
    }
    

    @objc func month3ButtonTapped(_sender: UIButton) {
        
        week1Button.noneSetting()
        month1Button.noneSetting()
        
        month3Button.colorSetting()
        
        totalButton.noneSetting()
    }
    
    
    @objc func totalButtonTapped(_sender: UIButton) {
        
        week1Button.noneSetting()
        month1Button.noneSetting()
        month3Button.noneSetting()
        
        totalButton.colorSetting()
    }
    
    
    
    
    
   
    
    
    // MARK: [Layout]
    func addSubView() {
        self.contentView.addSubview(self.stackView)

        
        
        self.stackView.addArrangedSubview(self.week1Button)
        self.stackView.addArrangedSubview(self.month1Button)
        self.stackView.addArrangedSubview(self.month3Button)
        self.stackView.addArrangedSubview(self.totalButton)
    }
    
    
    
    
    
    
    func layout() {
        layoutStackView()

      
    }
    
    
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            /*
            self.stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.85)
            */
            
            
            /*
            self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            */
        
        self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        self.stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        self.stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
            
            
            
            ])
    }
    
  
}



// MARK: [UIButton - Extension]
extension UIButton {
    
    
    func colorSetting() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        
        self.layer.borderColor = UIColor.black.cgColor
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        self.backgroundColor = .black
    }
    
    func noneSetting() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        
        self.layer.borderColor = UIColor.systemGray3.cgColor
        
        self.setTitleColor(UIColor.gray, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        self.backgroundColor = .white
    }
    
    
}
