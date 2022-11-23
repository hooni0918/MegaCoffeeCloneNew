//
//  MoreCardExpirationPeriodTVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//  카드 유효기간

import Foundation
import UIKit


class MoreCardExpirationPeriodTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    // MARK: [변수 선언]
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        
        title.font = .boldSystemFont(ofSize: 20)
        
        return title
    }()
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .equalCentering
       
        
        return stackView
    }()
    lazy var textFieldFirst: UITextField = {
        let text1 = UITextField()
        
        text1.placeholder = "MM"
        text1.textAlignment = .center
        
        text1.layer.borderWidth = 1
        text1.layer.borderColor = UIColor.gray.cgColor
        text1.layer.cornerRadius = 6
        
        text1.keyboardType = .numberPad
        
        return text1
    }()
    lazy var centerNonButton: UIButton = {
        let notBtn = UIButton(type: .system)
        
        notBtn.setTitleColor(UIColor.black, for: .normal)
        notBtn.isUserInteractionEnabled = false
        
        return notBtn
    }()
    
    
    
    
    lazy var textFieldSecond: UITextField = {
        let text2 = UITextField()
        
        text2.placeholder = "YY"
        text2.textAlignment = .center
        
        text2.layer.borderWidth = 1
        text2.layer.borderColor = UIColor.gray.cgColor
        text2.layer.cornerRadius = 6
        
        text2.keyboardType = .numberPad
        
        return text2
    }()
    
    
    
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        textFieldFirst.delegate = self
        textFieldSecond.delegate = self
        
        addSubView()
        layout()
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
    
    
    
    
    
    
    // MARK: [Add View]
    func addSubView() {
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(stackView)
        
        self.stackView.addArrangedSubview(textFieldFirst)
        self.stackView.addArrangedSubview(centerNonButton)
        self.stackView.addArrangedSubview(textFieldSecond)
        
    }
    
    
    
    
    // MARK: [Layout - Total]
    func layout() {
        layoutTitleLabel()
        layoutStackView()
    }
    
    
    // Layout - TitleLabel
    func layoutTitleLabel() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
            
            ])
    }
    
    // Layout - StackView
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.stackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.4),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            
            ])
        
        self.textFieldFirst.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.4).isActive = true
        self.centerNonButton.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.2).isActive = true
        self.textFieldSecond.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.4).isActive = true
    }
    

    
    
    
// MARK: [Class End]
            
}

// MARK: [Class End]




// MARK: [TextField - Delegate]
extension MoreCardExpirationPeriodTVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 2
    }
}

