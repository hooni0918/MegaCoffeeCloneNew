//
//  MoreCustomHeaderView.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//


import Foundation
import UIKit

class MoreCustomHeaderView: UITableViewHeaderFooterView {
  
    lazy var eventButton: UIButton = {
        let event = UIButton(type: .system)
        
        event.backgroundColor = .red
        event.setTitleColor(UIColor.white, for: .normal)
        event.tag = 1
        
        return event
    }()
    lazy var noticeButton: UIButton = {
        let notice = UIButton(type: .system)
        
        notice.backgroundColor = .lightGray
        notice.setTitleColor(UIColor.white, for: .normal)
        notice.tag = 2
        
        return notice
        
    }()
    lazy var rankingEventButton: UIButton = {
        let ranking = UIButton(type: .system)
        
        ranking.backgroundColor = .purple
        ranking.setTitleColor(UIColor.white, for: .normal)
        ranking.tag = 3
        
        return ranking
        
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    
    // 추후 추가 예정.
    // lazy var underBar = UIView()
    // self.underBar.backgroundColor = .black
    
    lazy var underLine: UIView = {
        let under = UIView()
        
        under.backgroundColor = .green
        
        return under
    }()
    
    
    
    
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        addSubView()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        //configureLayout()
    }
    
    
    
    
    
    func addSubView() {
        self.contentView.addSubview(self.stackView)
        //self.contentView.addSubview(self.underBar)
        self.contentView.addSubview(self.underLine)
        
        
        self.stackView.addArrangedSubview(self.eventButton)
        self.stackView.addArrangedSubview(self.noticeButton)
        self.stackView.addArrangedSubview(self.rankingEventButton)
    }
    
    
    
    
    
    
    func layout() {
        layoutStackView()
        //layoutUnderBar()
        layoutUnderLine()
    }
    
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.7),
            self.stackView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.91)
            ])
    }
    
    func layoutUnderBar() {
        //self.underBar.translatesAutoresizingMaskIntoConstraints = false
        
        /*
        NSLayoutConstraint.activate([
            self.underBar.topAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            self.underBar.leadingAnchor.constraint(equalTo: self.number1.leadingAnchor),
            self.underBar.trailingAnchor.constraint(equalTo: self.number1.trailingAnchor),
            self.underBar.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.2)
        ])
        */
    }
    
    func layoutUnderLine() {
        self.underLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.underLine.topAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            self.underLine.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.underLine.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.underLine.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            //self.underLine.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.1)
            self.underLine.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.09)
        ])
    }
    
    
    
    
    
  
}

