//
//  MoreCustomHeaderView.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//


import Foundation
import UIKit

class MoreCustomHeaderView: UITableViewHeaderFooterView {
    

    // MARK: [변수 선언]
    lazy var eventButton: UIButton = {
        let event = UIButton(type: .system)
        
        event.setTitleColor(UIColor.black, for: .normal)
        event.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        event.tag = 1
        
        event.addTarget(self, action: #selector(eventButtonTapped(_sender:)), for: .touchUpInside)
        
        return event
    }()
    
    
    
    lazy var noticeButton: UIButton = {
        let notice = UIButton(type: .system)

        notice.setTitleColor(UIColor.black, for: .normal)
        notice.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        notice.tag = 2
        
        notice.addTarget(self, action: #selector(noticeButtonTapped(_sender:)), for: .touchUpInside)
        
        return notice
        
    }()
    lazy var rankingEventButton: UIButton = {
        let ranking = UIButton(type: .system)
        
        ranking.setTitleColor(UIColor.black, for: .normal)
        ranking.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        ranking.tag = 3
        
        ranking.addTarget(self, action: #selector(rankingButtonTapped(_sender:)), for: .touchUpInside)
        
        return ranking
        
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    
    lazy var underBar1: UIView = {
        let bar = UIView()
        
        bar.backgroundColor = .black
        bar.layer.cornerRadius = 3
        
        return bar
    }()
    
    lazy var underBar2: UIView = {
        let bar = UIView()
        
        bar.backgroundColor = .black
        bar.layer.cornerRadius = 3
        
        
        return bar
    }()
    
    lazy var underBar3: UIView = {
        let bar = UIView()
        
        bar.backgroundColor = .black
        bar.layer.cornerRadius = 3
        
        return bar
    }()
    
    
    
    
    lazy var underLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = .systemGray
        
        return line
    }()
    
    
    
    
    
    
    
    // MARK: [Override]
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        

        underBar1.isHidden = false
        underBar2.isHidden = true
        underBar3.isHidden = true

        addSubView()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        //configureLayout()
    }
    
    
    
    
    
    
    // MARK: [Action]
    @objc func eventButtonTapped(_sender: UIButton) {
        
        underBar1.isHidden = false
        eventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        
        underBar2.isHidden = true
        noticeButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        underBar3.isHidden = true
        rankingEventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
    }
    
    @objc func noticeButtonTapped(_sender: UIButton) {
        
        underBar1.isHidden = true
        eventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        underBar2.isHidden = false
        noticeButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        
        underBar3.isHidden = true
        rankingEventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
    }
    
    @objc func rankingButtonTapped(_sender: UIButton) {
        
        underBar1.isHidden = true
        eventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        underBar2.isHidden = true
        noticeButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        underBar3.isHidden = false
        rankingEventButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
    }
    
    
    
    
    
    
    
    
    // MARK: [Layout]
    func addSubView() {
        self.contentView.addSubview(self.stackView)
        
        self.contentView.addSubview(self.underBar1)
        self.contentView.addSubview(self.underBar2)
        self.contentView.addSubview(self.underBar3)
        
        self.contentView.addSubview(self.underLine)
        
        
        self.stackView.addArrangedSubview(self.eventButton)
        self.stackView.addArrangedSubview(self.noticeButton)
        self.stackView.addArrangedSubview(self.rankingEventButton)
    }
    
    
    
    
    
    
    func layout() {
        layoutStackView()
        
        layoutUnderBar1()
        layoutUnderBar2()
        layoutUnderBar3()
        
        layoutUnderLine()
    }
    
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.7),
            self.stackView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.99)
            ])
    }
    
    func layoutUnderBar1() {
        self.underBar1.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            
            //self.underBar1.leadingAnchor.constraint(equalTo: self.eventButton.leadingAnchor),
            //self.underBar1.trailingAnchor.constraint(equalTo: self.eventButton.trailingAnchor),
            
            
            self.underBar1.leadingAnchor.constraint(equalTo: self.eventButton.leadingAnchor, constant: 8),
            
            
            self.underBar1.widthAnchor.constraint(equalToConstant: 50),
            
            self.underBar1.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -5),
            
            
            self.underBar1.heightAnchor.constraint(equalToConstant: 5)
            
     
            
        ])
        
    }
    
    
    func layoutUnderBar2() {
        self.underBar2.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            
            self.underBar2.leadingAnchor.constraint(equalTo: self.noticeButton.leadingAnchor, constant: 10),
            
            self.underBar2.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -5),
            
            self.underBar2.widthAnchor.constraint(equalToConstant: 65),
            
            
            self.underBar2.heightAnchor.constraint(equalToConstant: 5)
     
            
        ])
        
    }
    
    func layoutUnderBar3() {
        self.underBar3.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            self.underBar3.leadingAnchor.constraint(equalTo: self.rankingEventButton.leadingAnchor, constant: 10),
            
            self.underBar3.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -5),
            
            self.underBar3.widthAnchor.constraint(equalToConstant: 85),
            
            
            self.underBar3.heightAnchor.constraint(equalToConstant: 5)
     
            
        ])
        
    }
    
    func layoutUnderLine() {
        self.underLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.underLine.topAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            //
            self.underLine.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.underLine.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.underLine.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.underLine.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.01)
        ])
    }
}
