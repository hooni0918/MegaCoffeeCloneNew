//
//  LogoutViewController.swift
//  MegaTest
//
//  Created by 김성호 on 2022/11/04.
//

import Foundation
import UIKit


class MoreLogoutViewController: UIViewController {
    let customBrownColor = UIColor(r: 74, g: 44, b: 42)
    
    // MARK: [변수 선언] [0]: Frame
    private lazy var backViewButton: UIButton = {
       let back = UIButton()
        
        back.backgroundColor = .black
        back.alpha = 0.5
        
        back.addTarget(self, action: #selector(cancelTapped(sender:)), for: .touchUpInside)
        
        return back
    }()
    
    
    private lazy var centerView: UIView = {
      let center = UIView()
        
        center.backgroundColor = .white
        center.alpha = 1
        center.layer.cornerRadius = 7
    
        
        return center
    }()
    
    
    
    // MARK: [변수 선언] [1]: Center
    private lazy var logoutMentLabel: UILabel = {
       let logoutMent = UILabel()
        
        logoutMent.text = "로그아웃"
        logoutMent.font = .boldSystemFont(ofSize: 20)
        logoutMent.textAlignment = .center
        
        return logoutMent
    }()
    
    
    
    private lazy var logoutInfoLabel: UILabel = {
       let logoutInfo = UILabel()
        
        logoutInfo.text = "로그아웃 하시겠습니까?"
        logoutInfo.textAlignment = .center
        
        return logoutInfo
    }()
    
    
    
    // MARK: [변수 선언] [2]: Bottom
    private lazy var cancel: UIButton = {
       let cancel = UIButton()
        
        cancel.setTitle("취소", for: .normal)
        cancel.setTitleColor(customBrownColor, for: .normal)
        cancel.backgroundColor = .systemGray6
        
        cancel.addTarget(self, action: #selector(cancelTapped(sender:)), for: .touchUpInside)
        
        return cancel
        
    }()
    
    private lazy var confirm: UIButton = {
       let confirm = UIButton()
        
        confirm.setTitle("로그아웃", for: .normal)
        confirm.setTitleColor(.white, for: .normal)
        confirm.backgroundColor = customBrownColor
        
        confirm.addTarget(self, action: #selector(confirmTapped(sender:)), for: .touchUpInside)
        
        
        return confirm
        
        
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.addArrangedSubview(self.cancel)
        stackView.addArrangedSubview(self.confirm)
        
        stackView.distribution = .fillEqually
        
        
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 7
        stackView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    
        
        return stackView
    }()

    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    

    // MARK: [Keyboard]
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 4
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    
    // MARK: [Action]
    @objc func cancelTapped(sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    @objc func confirmTapped(sender: UIButton) {
        print("로그아웃 완료")
    }
    
    
    

// MARK: [Class End]
        
}

// MARK: [Class End]









// MARK: [Layout]
extension MoreLogoutViewController {
    private func layout() {
        layoutBackViewButton()
        layoutCenterView()
        
        layoutTitleLabel()
        layoutStackView()
        
        layoutLogoutInfoLabel()
    }
    
    
    // BackView
    private func layoutBackViewButton() {
        self.view.addSubview(self.backViewButton)
        
        self.backViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backViewButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.backViewButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.backViewButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.backViewButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    // CenterView
    private func layoutCenterView() {
        self.view.addSubview(self.centerView)
        
        self.centerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.centerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.centerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.centerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2)
        ])
    }
    
    // TitleLabel
    private func layoutTitleLabel() {
        self.centerView.addSubview(self.logoutMentLabel)
       
        
        self.logoutMentLabel.translatesAutoresizingMaskIntoConstraints = false
       
        
        NSLayoutConstraint.activate([
            self.logoutMentLabel.centerXAnchor.constraint(equalTo: self.centerView.centerXAnchor),
            self.logoutMentLabel.topAnchor.constraint(equalTo: self.centerView.topAnchor, constant: 40),
            self.logoutMentLabel.leadingAnchor.constraint(equalTo: self.centerView.leadingAnchor, constant: 10),
            self.logoutMentLabel.trailingAnchor.constraint(equalTo: self.centerView.trailingAnchor, constant: -10)
        ])
        
        
    }
    
    
    // StackView
    private func layoutStackView() {
        self.centerView.addSubview(self.stackView)
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            self.stackView.leadingAnchor.constraint(equalTo: self.centerView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.centerView.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.centerView.bottomAnchor),
            self.stackView.heightAnchor.constraint(equalTo: self.centerView.heightAnchor, multiplier: 0.25)
        ])
    }
    
    
    // LogoutInfoLabel
    private func layoutLogoutInfoLabel() {
        
        self.centerView.addSubview(self.logoutInfoLabel)
        
        self.logoutInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.logoutInfoLabel.centerXAnchor.constraint(equalTo: self.centerView.centerXAnchor),
            self.logoutInfoLabel.topAnchor.constraint(equalTo: self.logoutMentLabel.bottomAnchor, constant: 10),
            self.logoutInfoLabel.leadingAnchor.constraint(equalTo: self.centerView.leadingAnchor, constant: 10),
            self.logoutInfoLabel.trailingAnchor.constraint(equalTo: self.centerView.trailingAnchor, constant: -10)
        ])
    }
    
    
    
    
}

