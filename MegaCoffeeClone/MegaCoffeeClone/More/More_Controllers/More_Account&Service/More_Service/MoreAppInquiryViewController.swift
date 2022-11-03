//
//  AppInquiryViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/31.
//

import UIKit

class MoreAppInquiryViewController: MoreInquiryBaseViewController {

    
    // MARK: [변수 선언] [1] Choice Button
    private lazy var choiceInquiryTypeButton: UIButton = {
        let choiceButton = UIButton(type: .system)
        
        
        choiceButton.setTitle("문의 유형을 선택해주세요", for: .normal)
        choiceButton.setTitleColor(.black, for: .normal)
        
        let chevronImage = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        //
        
        //choiceButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        choiceButton.setImage(chevronImage, for: .normal)
        
        choiceButton.imageView?.contentMode = .scaleAspectFit
        choiceButton.semanticContentAttribute = .forceRightToLeft

        choiceButton.contentHorizontalAlignment = .left
        choiceButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        choiceButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 160, bottom: 0, right: 0)
        //choiceButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        
        
        choiceButton.layer.cornerRadius = 7
        choiceButton.layer.borderWidth = 1
        choiceButton.layer.borderColor = UIColor.gray.cgColor
        
        
        return choiceButton
    }()
    
    
    // MARK: [변수 선언] [2] Write View
    private lazy var writeContentBackView: UIView = {
        let writeView = UIView(frame: .zero)
        
        writeView.layer.cornerRadius = 7
        writeView.layer.borderWidth = 1
        writeView.layer.borderColor = UIColor.gray.cgColor
        
        return writeView
    }()
    
    private lazy var titleTextField = UITextField()
    private lazy var titleTextFieldBottomLineView = UIView()
    private lazy var textView = UITextView()
    
    
    
    
    //
    private lazy var imageLabelView = UIView()
    private lazy var imageLabel: UILabel = {
        let imageLabel = UILabel()
        
        imageLabel.layer.cornerRadius = 7
        imageLabel.layer.borderWidth = 1
        imageLabel.layer.borderColor = UIColor.gray.cgColor
        
        return imageLabel
    }()
    
    
    
    
    
    // MARK: [변수 선언] [3] photoRegistration
    private lazy var photoRegistrationButton: UIButton = {
        let photo = UIButton(type: .system)
        
        photo.setTitle("사진 등록", for: .normal)
        photo.layer.cornerRadius = 7
        
        return photo
    }()
    
    lazy var fileInforLabel: UILabel = {
        let file = UILabel()
        
        file.text = "파일첨부는 아래의 파일만 등록이 가능하며\n최대2개(1개당 최대10MB), 총 20MB까지 등록이\n가능합니다.\n(등록 가능 확장자: jpg, jpeg, png, gif)"
        file.numberOfLines = 0
        
        return file
    }()
    
    
    
    
    // MARK: [변수 선언] [4] Bottom
    lazy var inquiryRegistrationButtonButton: UIButton = {
        let inquiry = UIButton(type: .system)
        
        inquiry.setTitle("문의 등록", for: .normal)
        inquiry.layer.cornerRadius = 7
        
        return inquiry
    }()
    
    
    
    lazy var contentInitializationButton: UIButton = {
        let content = UIButton()
        
        content.setTitle("내용 초기화", for: .normal)
        content.layer.cornerRadius = 7
        
        return content
    }()
    
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
    
    
    
    override func layoutThickLineView() {
        self.topView.addSubview(self.thickLineView)
        
        self.thickLineView.backgroundColor = .black
        self.thickLineView.layer.cornerRadius = 4
        
        self.thickLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.thickLineView.leadingAnchor.constraint(equalTo: self.contactUsButton.leadingAnchor),
            self.thickLineView.topAnchor.constraint(equalTo: self.contactUsButton.bottomAnchor),
            self.thickLineView.widthAnchor.constraint(equalTo: self.contactUsButton.widthAnchor),
            self.thickLineView.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        
    }
    
  
    
    
    
    
    // MARK: [Action]
    @objc override func historyInquiriesButtonTapped(sender: UIButton) {
        let vc = MoreHistoryInquiriyViewController()
        self.navigationController?.pushViewController(vc, animated: false)

    }
    
    

    
    
    
    
    
    


// MARK: [Class End]
                
}

// MARK: [Class End]











// MARK: [Layout]
extension MoreAppInquiryViewController {
    
    private func layout() {
        layoutContactUsButton()
        
        layoutChoiceInquiryType()
        layoutWriteContentView()
        layoutMarkImage()
        layoutFileInfoAndButton()
    }
    
    
    
    // [3]
    private func layoutChoiceInquiryType() {
        layoutChoiceInquiryTypeButton()
    }
    
    
    // [4]
    private func layoutWriteContentView() {
        layoutWriteContentBackView()
        layoutTitleTextField()
        layoutTextFieldBottomLineView()
        layoutTextView()
    }
    
    // [5]
    private func layoutMarkImage() {
        layoutImageLabel()
        layoutPhotoRegistrationButton()
    }
    
    // [6]
    private func layoutFileInfoAndButton() {
        layoutFileInforLabel()
        layoutInquiryRegistrationButton()
        layoutContentInitializationButtonButton()
    }
    
    
    
    
    // Button Bold
    private func layoutContactUsButton() {
        contactUsButton.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        historyInquiriesButton.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }
    
    
    
    
    // ChoiceInquiryTypeButton
    private func layoutChoiceInquiryTypeButton() {
        self.contentView.addSubview(self.choiceInquiryTypeButton)
        
        
        self.choiceInquiryTypeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.choiceInquiryTypeButton.topAnchor.constraint(equalTo: self.bottomLineView.bottomAnchor, constant: 20),
            self.choiceInquiryTypeButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.choiceInquiryTypeButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.choiceInquiryTypeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
    
    
    
    
    
    
    // TextField BackView
    private func layoutWriteContentBackView() {
        self.contentView.addSubview(self.writeContentBackView)
        
        self.writeContentBackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.writeContentBackView.topAnchor.constraint(equalTo: self.choiceInquiryTypeButton.bottomAnchor, constant: 20),
            self.writeContentBackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.writeContentBackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.writeContentBackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
    
    // TextField
    private func layoutTitleTextField() {
        self.writeContentBackView.addSubview(self.titleTextField)
        
        self.titleTextField.placeholder = "제목을 입력해 주세요. (50자이내)"

        self.titleTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleTextField.topAnchor.constraint(equalTo: self.writeContentBackView.topAnchor, constant: 5),
            self.titleTextField.leadingAnchor.constraint(equalTo: self.writeContentBackView.leadingAnchor, constant: 10),
            self.titleTextField.trailingAnchor.constraint(equalTo: self.writeContentBackView.trailingAnchor, constant: -10),
            self.titleTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // TextField - BottomLine
    private func layoutTextFieldBottomLineView() {
        self.writeContentBackView.addSubview(self.titleTextFieldBottomLineView)
        
        self.titleTextFieldBottomLineView.backgroundColor = .gray
        
        self.titleTextFieldBottomLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleTextFieldBottomLineView.topAnchor.constraint(equalTo: self.titleTextField.bottomAnchor),
            self.titleTextFieldBottomLineView.leadingAnchor.constraint(equalTo: self.writeContentBackView.leadingAnchor),
            self.titleTextFieldBottomLineView.trailingAnchor.constraint(equalTo: self.writeContentBackView.trailingAnchor),
            self.titleTextFieldBottomLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    
    
    // TextView
    private func layoutTextView() {
        self.writeContentBackView.addSubview(self.textView)
        
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textView.topAnchor.constraint(equalTo: self.titleTextFieldBottomLineView.bottomAnchor, constant: 5),
            self.textView.leadingAnchor.constraint(equalTo: self.writeContentBackView.leadingAnchor, constant: 5),
            self.textView.trailingAnchor.constraint(equalTo: self.writeContentBackView.trailingAnchor,constant: -5),
            self.textView.bottomAnchor.constraint(equalTo: self.writeContentBackView.bottomAnchor, constant: -5)
        ])
    }
    
    
    
    
    
    
    // ImageLabel
    private func layoutImageLabel() {
        self.contentView.addSubview(self.imageLabel)
        
        self.imageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.imageLabel.topAnchor.constraint(equalTo: self.writeContentBackView.bottomAnchor, constant: 20),
            self.imageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.imageLabel.widthAnchor.constraint(equalTo: self.writeContentBackView.widthAnchor, multiplier: 0.7),
            self.imageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    // PhotoRegistrationButton
    private func layoutPhotoRegistrationButton() {
        self.contentView.addSubview(self.photoRegistrationButton)
        
        self.photoRegistrationButton.backgroundColor = .systemGray3
        
        self.photoRegistrationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.photoRegistrationButton.topAnchor.constraint(equalTo: self.writeContentBackView.bottomAnchor, constant: 20),
            self.photoRegistrationButton.leadingAnchor.constraint(equalTo: self.imageLabel.trailingAnchor, constant: 10),
            self.photoRegistrationButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.photoRegistrationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
    
    
    
    // FileInforLabel
    private func layoutFileInforLabel() {
        self.contentView.addSubview(self.fileInforLabel)
        
        self.fileInforLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.fileInforLabel.topAnchor.constraint(equalTo: self.imageLabel.bottomAnchor, constant: 10),
            self.fileInforLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.fileInforLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.fileInforLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    
    
    // InquiryRegistrationButton
    private func layoutInquiryRegistrationButton() {
        self.contentView.addSubview(self.inquiryRegistrationButtonButton)
        
        self.inquiryRegistrationButtonButton.backgroundColor = .systemGray4
        
        self.inquiryRegistrationButtonButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.inquiryRegistrationButtonButton.topAnchor.constraint(equalTo: self.fileInforLabel.bottomAnchor, constant: 15),
            self.inquiryRegistrationButtonButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.inquiryRegistrationButtonButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.inquiryRegistrationButtonButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    // ContentInitializationButtonButton
    private func layoutContentInitializationButtonButton() {
        self.contentView.addSubview(self.contentInitializationButton)
        
        self.contentInitializationButton.backgroundColor = .systemGray5
        
        self.contentInitializationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentInitializationButton.topAnchor.constraint(equalTo: self.inquiryRegistrationButtonButton.bottomAnchor, constant: 10),
            self.contentInitializationButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.contentInitializationButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.contentInitializationButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}
