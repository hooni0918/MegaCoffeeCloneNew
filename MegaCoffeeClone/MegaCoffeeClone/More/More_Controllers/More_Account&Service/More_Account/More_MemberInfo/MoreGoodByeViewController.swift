//
//  GoodByeViewController.swift
//  MegaTest
//
//  Created by 김성호 on 2022/11/04.
//

import UIKit

class MoreGoodByeViewController: UIViewController {
    
    // MARK: [변수 선언] [0]: Frame
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    
    
    
    // MARK: [변수 선언] [1]: Top
    private lazy var mainLabel: UILabel = {
       let main = UILabel()
        
        main.text = "정말로 탈퇴하시겠습니까?"
        main.textColor = .black
        main.font = .boldSystemFont(ofSize: 23)
        
        return main
    }()
    
    
    private lazy var subLabel: UILabel = {
       let sub = UILabel()
        
        sub.text = "한 번 삭제된 정보는 복구가 불가능합니다.\n카카오 계정 연결 해지를 위해 카카오톡 로그인이 필요할\n수 있습니다.\n재가입은 탈퇴일로부터 30일 후 가능합니다."
        sub.numberOfLines = 0
        sub.textColor = .black
        sub.font = .systemFont(ofSize: 15)
        
        
        return sub
    }()
    
    
    
    // MARK: [변수 선언] [2]: Receives Data
    private lazy var backView: UIView = {
        let back = UIView()
        
        back.layer.cornerRadius = 6
        
        return back
    }()
    
    
    private lazy var infolabel1: UILabel = {
       let info1 = UILabel()
        
        info1.text = "메가 카드 징수(금액)"
        info1.font = .systemFont(ofSize: 15)
        
        return info1
    }()
    
    private lazy var infolabel2: UILabel = {
       let info2 = UILabel()
        
        info2.text = "받은 선물"
        info2.font = .systemFont(ofSize: 15)
        
        return info2
    }()
    
    private lazy var infolabel3: UILabel = {
       let info3 = UILabel()
        
        info3.text = "보유 스탬프"
        info3.font = .systemFont(ofSize: 15)
        
        return info3
    }()
    
    private lazy var infolabel4: UILabel = {
       let info4 = UILabel()
        
        info4.text = "보유 쿠폰"
        info4.font = .systemFont(ofSize: 15)
        
        return info4
    }()
    
    private lazy var infolabel5: UILabel = {
       let info5 = UILabel()
        
        info5.text = "받은 선물(구)"
        info5.font = .systemFont(ofSize: 15)
        
        return info5
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        
        stackView.addArrangedSubview(infolabel1)
        stackView.addArrangedSubview(infolabel2)
        stackView.addArrangedSubview(infolabel3)
        stackView.addArrangedSubview(infolabel4)
        stackView.addArrangedSubview(infolabel5)
        
        
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        
        return stackView
    }()
    
    
    // MARK: [변수 선언] [3]: Bottom
    private lazy var confirmButton: UIButton = {
        let confirm = UIButton(type: .system)
        
        confirm.setTitle("내용을 확인했습니다.", for: .normal)
        confirm.setTitleColor(.black, for: .normal)
        
        return confirm
    }()
    
    private lazy var goodbyeButton: UIButton = {
        let goodbye = UIButton(type: .system)
        
        goodbye.setTitle("탈퇴", for: .normal)
        goodbye.setTitleColor(.white, for: .normal)
        goodbye.layer.cornerRadius = 6
        
        return goodbye
    }()
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    

// MARK: [Class End]
    
}

// MARK: [Class End]








// MARK: [Layout]
extension MoreGoodByeViewController {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        
        naviCustom()
        
        layoutScrollView()
        layoutContentView()
        //
        layoutMainLabel()
        layoutSubLabel()
        //
        layoutBackView()
        layoutStackView()
        //
        layoutConfirmButton()
        layoutGoodByeButton()
    }
    
    
    
    // NaviCustom
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        /*
        let img = UIImage(systemName: "xmark")
        self.navigationController?.navigationBar.backIndicatorImage = img
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = img
        */
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    
    // ScrollView
    private func layoutScrollView() {
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

        ])
    }
    
    // ContentView
    private func layoutContentView() {
        self.scrollView.addSubview(self.contentView)
       
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
            
        ])
        
    }
    
    
    
    
    // MainLabel
    private func layoutMainLabel() {
        self.contentView.addSubview(self.mainLabel)
        
        self.mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.mainLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.mainLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.mainLabel.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
    // SubLabel
    private func layoutSubLabel() {
        self.contentView.addSubview(self.subLabel)
        
        self.subLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.subLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor),
            self.subLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.subLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.subLabel.heightAnchor.constraint(equalToConstant: 90)
            
        ])
        
    }
    
    // BackView
    private func layoutBackView() {
        self.contentView.addSubview(self.backView)
        
        self.backView.backgroundColor = .systemGray6
        
        self.backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backView.topAnchor.constraint(equalTo: self.subLabel.bottomAnchor, constant: 60),
            self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.backView.heightAnchor.constraint(equalToConstant: 330)
            
        ])
    }
    
    // StackView
    private func layoutStackView() {
        self.backView.addSubview(self.stackView)
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 20),
            self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -10),
            self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -20)
            
        ])
    }
    
    // ConfirmButton
    private func layoutConfirmButton() {
        self.contentView.addSubview(self.confirmButton)
        
        self.confirmButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.confirmButton.topAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 50),
            self.confirmButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.confirmButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.confirmButton.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
    // GoodByeButton
    private func layoutGoodByeButton() {
        self.contentView.addSubview(self.goodbyeButton)
        
        self.goodbyeButton.backgroundColor = .lightGray
        
        self.goodbyeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.goodbyeButton.topAnchor.constraint(equalTo: self.confirmButton.bottomAnchor, constant: 10),
            self.goodbyeButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.goodbyeButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.goodbyeButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
