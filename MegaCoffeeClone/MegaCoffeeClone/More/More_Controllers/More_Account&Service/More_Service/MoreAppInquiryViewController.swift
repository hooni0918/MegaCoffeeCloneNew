//
//  AppInquiryViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/31.
//

import UIKit

class MoreAppInquiryViewController: MoreInquiryBaseViewController {
    let customBrownColor = UIColor(r: 74, g: 44, b: 42)
    let choiceInquiryVC = MoreChoiceInquiryTypeViewController()
    let vc = UIImagePickerController()
    
    // MARK: [변수 선언] [1] Choice Button
    private lazy var choiceInquiryTypeButton: UIButton = {
        let choiceButton = UIButton(type: .system)
        
        
        choiceButton.setTitle("문의 유형을 선택해주세요", for: .normal)
        choiceButton.setTitleColor(.black, for: .normal)
        
        let chevronImage = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        //
        
        //choiceButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        choiceButton.setImage(chevronImage, for: .normal)
        
        choiceButton.imageView?.contentMode = .topRight
        choiceButton.semanticContentAttribute = .forceRightToLeft

        
        choiceButton.contentHorizontalAlignment = .left
        choiceButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        choiceButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 160, bottom: 0, right: 0)
        //choiceButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        
        
        choiceButton.layer.cornerRadius = 7
        choiceButton.layer.borderWidth = 1
        choiceButton.layer.borderColor = UIColor.gray.cgColor
        
        
        choiceButton.addTarget(self, action: #selector(choiceInquiryTypeButtonTapped(sender:)), for: .touchUpInside)
        
        //choiceInquiryVC.delegate = self
        
        
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
    private lazy var textView: UITextView = {
        let textView = UITextView()
        
        textView.font = .systemFont(ofSize: 17)
        
        return textView
    }()
    
    
    
    
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
        photo.setTitleColor(customBrownColor, for: .normal)
    
        photo.backgroundColor = UIColor(r: 241, g: 224, b: 172)
        photo.titleLabel?.font = .boldSystemFont(ofSize: 18)
        photo.layer.cornerRadius = 7
        
        photo.showsMenuAsPrimaryAction = true
        photo.addTarget(self, action: #selector(photoTapped(sender:)), for: .touchUpInside)
        
        return photo
    }()
    
    private lazy var fileInforLabel: UILabel = {
        let file = UILabel()
        
        file.text = "파일첨부는 아래의 파일만 등록이 가능하며\n최대2개(1개당 최대10MB), 총 20MB까지 등록이\n가능합니다.\n(등록 가능 확장자: jpg, jpeg, png, gif)"
        file.numberOfLines = 0
        
        return file
    }()
    
    
    
    
    // MARK: [변수 선언] [4] Bottom
    private lazy var inquiryRegistrationButton: UIButton = {
        let inquiry = UIButton(type: .system)
        
        inquiry.setTitle("문의 등록", for: .normal)
        inquiry.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        
        inquiry.setTitleColor(UIColor.white, for: .normal)
        
        
        inquiry.backgroundColor = .systemGray4
        
        // inquiry.backgroundColor = customBrownColor
        
        inquiry.isEnabled = false
        
        
        
        
        
        inquiry.layer.cornerRadius = 7
        
        return inquiry
    }()
    
    
    
    private lazy var contentInitializationButton: UIButton = {
        let content = UIButton()
        
        content.setTitle("내용 초기화", for: .normal)
        content.setTitleColor(customBrownColor, for: .normal)
    
        content.backgroundColor = UIColor(r: 241, g: 224, b: 172)
        
        content.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        content.layer.cornerRadius = 7

        
        content.addTarget(self, action: #selector(contentInitializationButtonTapped), for: .touchUpInside)
        
        
        
        
        return content
    }()

    
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first , touch.view == self.view {
            dismiss(animated: true)
        }
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
    // histroy
    @objc override func historyInquiriesButtonTapped(sender: UIButton) {
        let vc = MoreHistoryInquiriyViewController()
        self.navigationController?.pushViewController(vc, animated: false)

    }
    
    // inquiry button
    @objc private func choiceInquiryTypeButtonTapped(sender: UIButton) {
        
        
        // app -> choice로 가는 곳
        let vc = MoreChoiceInquiryTypeViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    
    // init button
    @objc private func contentInitializationButtonTapped(sender: UIButton) {
        
        // 먹지 않아....
        if let memo = self.textView.text, memo.count < 0, let memo1 = self.titleTextField.text, memo1.count < 0 {
            
            print("1")
            
        } else {
            
            alertRemoveAll()
        }
         
        
        
        alertRemoveAll()
        
        func alertRemoveAll() {
            let alert = UIAlertController(title: "", message: "작성 내용을 초기화 하시겠습니까?", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default)
            { [ weak self ] (action) in
                
                // 문의 유형 : choiceInquiryTypeButton 초기화
                // 이미지 레이블 초기화
                self?.choiceInquiryTypeButton.setTitle("문의 유형을 선택해주세요", for: .normal)
                self?.titleTextField.text = ""
                self!.textView.text = ""
               
            }
            
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
       
        
    }
    
    // MARK: Photo Tapped
    @objc func photoTapped(sender: UIButton) {
        let gallery = UIAction(title: "사진 보관함", image: UIImage(systemName: "heart")) { _ in
            print("사진 보관함 실행")
            self.openGallary()
        }
        let camera = UIAction(title: "사진 찍기", image: UIImage(systemName: "heart")) { _ in
            print("사진 찍기 실행")
            self.openCamera()
        }
        let choiceFile = UIAction(title: "파일 선택", image: UIImage(systemName: "heart")) { _ in
            print("파일 선택 실행")
        }
        
        photoRegistrationButton.menu = UIMenu(title: "",
                             image: UIImage(systemName: ""),
                             identifier: nil,
                             options: .displayInline,
                             children: [choiceFile, camera, gallery])
        
    }
    
    
    
    
    
    
    
    // MARK: [func]
    private func openCamera() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            
            vc.sourceType = .camera
            vc.allowsEditing = true
            self.present(vc, animated: true)
            
            
        } else {
            
            let alert = UIAlertController(title: "W", message: "You", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true)
            
        }
    }
    
    
    private func openGallary() {
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        self.present(vc, animated: true)
    }
    
    

    
    
    
    
    
    


// MARK: [Class End]
                
}

// MARK: [Class End]





// MARK: [Protocol]

extension MoreAppInquiryViewController: choiceInquiryTypeData {
    func choiceStampData() {
        self.choiceInquiryTypeButton.setTitle("스탬프", for: .normal)
        saveTextView()
    }
    
    
    func choiceCouponData() {
        choiceInquiryTypeButton.setTitle("쿠폰", for: .normal)
        saveTextView()
    }
    
    
    func choiceMegaCardRefundData() {
        choiceInquiryTypeButton.setTitle("메가선불카드 환불", for: .normal)
        self.textView.text = """
                            * 앱을 이용한 일반카드결제는 매장에서 취소 해주시길 바랍니다.
                            * 일반선물하기 취소건은 카카오톡채널(ID: 발트루스트)로 문의해주세요.
                            
                            성함 :
                            연락처 :
                            받는사람 연락처(선물하기의 경우) :
                            카드 바코드번호 :
                            환불사유 :
                            """
    }
    
    
    func choiceErrorData() {
        choiceInquiryTypeButton.setTitle("오류", for: .normal)
        saveTextView()
    }
    
    
    func choiceUserInfoData() {
        choiceInquiryTypeButton.setTitle("회원정보", for: .normal)
        saveTextView()
    }
    
    
    
    
    @objc func saveTextView() {
        self.textView.text = """
                            이용매장 :
                            방문시기 :
                            주문번호 :
                            연락처 :
                            문의내용 :
                            """
    }
    
   
    
}





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
        self.contentView.addSubview(self.inquiryRegistrationButton)
        
        self.inquiryRegistrationButton.backgroundColor = .systemGray4
        
        self.inquiryRegistrationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.inquiryRegistrationButton.topAnchor.constraint(equalTo: self.fileInforLabel.bottomAnchor, constant: 15),
            self.inquiryRegistrationButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.inquiryRegistrationButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.inquiryRegistrationButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    // ContentInitializationButtonButton
    private func layoutContentInitializationButtonButton() {
        self.contentView.addSubview(self.contentInitializationButton)
        
        self.contentInitializationButton.backgroundColor = .systemGray5
        
        self.contentInitializationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentInitializationButton.topAnchor.constraint(equalTo: self.inquiryRegistrationButton.bottomAnchor, constant: 10),
            self.contentInitializationButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.contentInitializationButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.contentInitializationButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}
