//
//  MoreCardCustomerTVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//  고객 구분

import Foundation
import UIKit


class MoreCardCustomerTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
    // MARK: Image
    let circleImg = UIImage(systemName: "circle")?.withTintColor(UIColor.gray, renderingMode: .alwaysOriginal)
    let circleFillImg = UIImage(systemName: "circle.inset.filled")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
    
    

    // MARK: [변수 선언] [0]: Top
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        
        title.font = .boldSystemFont(ofSize: 20)
        
        return title
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    
    
    
    
    
    
    // MARK: [변수 선언] [1]: 개인카드
    lazy var stackViewFirst: UIStackView = {
        let first = UIStackView()
        
       
        first.distribution = .fillProportionally
        
        return first
    }()
    
    lazy var personalCardCircle: UIButton = {
        let circle = UIButton(type: .system)
        
        circle.setImage(circleImg, for: .normal)
        
        return circle
    }()
    
    lazy var personalCardCircleFill: UIButton = {
        let fill = UIButton(type: .system)
        
        fill.setImage(circleFillImg, for: .normal)
        
        return fill
    }()
    
    lazy var personalCardButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitleColor(UIColor.black, for: .normal)
        
        return button
    }()
    
    
    
    
    
    
    
    
    // MARK: [변수 선언] [2]: 법인카드
    lazy var stackViewSecond: UIStackView = {
        let second = UIStackView()
        
   
        second.distribution = .fillProportionally
        
        return second
    }()
    lazy var corporationCardCircle: UIButton = {
        let circle = UIButton(type: .system)
        
        circle.setImage(circleImg, for: .normal)
        
        return circle
    }()
    lazy var corporationCardCircleFill: UIButton = {
        let fill = UIButton(type: .system)
        
        fill.setImage(circleFillImg, for: .normal)
        
        return fill
    }()
    lazy var corporationCardButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitleColor(UIColor.black, for: .normal)
        
        return button
    }()
    
    
    
    
    
    
    
    // MARK: [변수 선언] [3]: Bottom
    lazy var textField: UITextField = {
        let text = UITextField()
        
        text.placeholder = "생년월일 6자리 (YYMMDD)"
        
        text.addLeftPadding()
        
        
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 6
        
        text.keyboardType = .numberPad
        
        return text
    }()
    
   
    lazy var rejectRegistrationButton: UIButton = {
        let button = UIButton(type: .system)
    
        return button
    }()
    
    
    
    lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = .systemGray4
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        
        return button
    }()
    
    
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        textField.delegate = self

        
        addSubView()
        layout()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
    
    // MARK: [Add View]
    func addSubView() {
        
            self.contentView.addSubview(self.titleLabel)
            self.contentView.addSubview(self.stackView)
            
            self.stackView.addArrangedSubview(self.stackViewFirst)
            self.stackView.addArrangedSubview(self.stackViewSecond)
            
            //self.stackViewFirst.addArrangedSubview(self.personalCardCircle)
            self.stackViewFirst.addArrangedSubview(self.personalCardCircleFill)
            self.stackViewFirst.addArrangedSubview(self.personalCardButton)
            
            //self.stackViewSecond.addArrangedSubview(self.corporationCardCircle)
            self.stackViewSecond.addArrangedSubview(self.corporationCardCircleFill)
            self.stackViewSecond.addArrangedSubview(self.corporationCardButton)
            
            self.contentView.addSubview(self.textField)
            self.contentView.addSubview(self.registrationButton)
        
    }
    
    
    // MARK: [Layout - Total]
    func layout() {
        
        layoutTitleLabel()
        layoutStackView()
        layoutTextField()
        layoutRegistrationButton()
        
    }
    
    
    func layoutTitleLabel() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
            
        ])
    }
    
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.stackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5),
            self.stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
            
        ])
    }
    
    
    

    func layoutTextField() {
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.textField.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 10),
            self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.textField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
            
        ])
    }
    
    func layoutRegistrationButton() {
        self.registrationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.registrationButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 30),
            self.registrationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.registrationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            //self.registrationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.registrationButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
            
        ])
    }
    
    
    func configure() {
        
        self.personalCardButton.setTitleColor(UIColor.black, for: .normal)
        self.corporationCardButton.setTitleColor(UIColor.black, for: .normal)
        
        
    }
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]






// MARK: [TextField - Delegate]
extension MoreCardCustomerTVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 6
    }
}




// Helper
// https://developer-fury.tistory.com/46
extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

