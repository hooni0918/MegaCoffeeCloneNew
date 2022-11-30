//
//  MoreCardNumberTVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//  카드 번호

import Foundation
import UIKit


class MoreCardNumberTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    var dotTextField2 = ""
    var dotTextField3 = ""
    
    
    // MARK: [변수 선언]
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        
        title.font = .boldSystemFont(ofSize: 20)
        
        return title
    }()
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    lazy var textField1: UITextField = {
        let text1 = UITextField()
        
        text1.layer.borderWidth = 1
        text1.layer.borderColor = UIColor.gray.cgColor
        text1.layer.cornerRadius = 6
        
        text1.textAlignment = .center
        
        text1.keyboardType = .numberPad
        
        return text1
    }()
    lazy var textField2: UITextField = {
        let text2 = UITextField()
        
        text2.layer.borderWidth = 1
        text2.layer.borderColor = UIColor.gray.cgColor
        text2.layer.cornerRadius = 6
        
        text2.textAlignment = .center
        
        text2.keyboardType = .numberPad
        
        return text2
    }()
    lazy var textField3: UITextField = {
        let text3 = UITextField()
        
        text3.layer.borderWidth = 1
        text3.layer.borderColor = UIColor.gray.cgColor
        text3.layer.cornerRadius = 6
        
        text3.textAlignment = .center
        
        text3.keyboardType = .numberPad
        
        return text3
    }()
    lazy var textField4: UITextField = {
        let text4 = UITextField()
        
        text4.layer.borderWidth = 1
        text4.layer.borderColor = UIColor.gray.cgColor
        text4.layer.cornerRadius = 6
        
        text4.textAlignment = .center
        
        text4.keyboardType = .numberPad
        
        return text4
    }()
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        self.textField1.delegate = self
        self.textField2.delegate = self
        self.textField3.delegate = self
        self.textField4.delegate = self
        
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
        
        self.stackView.addArrangedSubview(textField1)
        self.stackView.addArrangedSubview(textField2)
        self.stackView.addArrangedSubview(textField3)
        self.stackView.addArrangedSubview(textField4)
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
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            
            
        ])
    }
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]




// MARK: [TextField - Delegate]
extension MoreCardNumberTVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        var hashPassword = String()
        let newChar = string.first
        
        
        // textField 2
        if textField == textField2 {
            
            let offsetToUpdate = dotTextField2.index(dotTextField2.startIndex, offsetBy: range.location)
            
            if string == "" {
                dotTextField2.remove(at: offsetToUpdate)
                return true
                
            } else { dotTextField2.insert(newChar!, at: offsetToUpdate) }
            
            for _ in 0..<dotTextField2.count {  hashPassword += "●" }
            textField.text = hashPassword
            return false
        }
        
        
        
        // textField 3
        if textField == textField3 {
            
            let offsetToUpdate = dotTextField3.index(dotTextField3.startIndex, offsetBy: range.location)
            
            if string == "" {
                dotTextField3.remove(at: offsetToUpdate)
                return true
                
            } else { dotTextField3.insert(newChar!, at: offsetToUpdate) }
            
            for _ in 0..<dotTextField3.count {  hashPassword += "●" }
            textField.text = hashPassword
            return false
        }
        
        
        
        // 글자수 제한, counting
        
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 4
        
        
        //return true
        
    }
    
}





