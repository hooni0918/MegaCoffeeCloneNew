//
//  GiftPaymentVC.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/26.
//

import UIKit
import ContactsUI

class GiftPaymentVC: UIViewController{
    

    @IBOutlet weak var paymentTableView: UITableView!
    
    struct Contact {
        let name: String
        let phoneNumber: String
    }
    
    var contactArray = [Contact]()
    
    var giftSelf = false
    
    let coreDataManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        paymentTableView.register(UINib(nibName: "GiftContactTableViewCell", bundle: nil), forCellReuseIdentifier: "contactCell")
        
        paymentTableView.register(UINib(nibName: "GiftShoppingBasketTableViewCell", bundle: nil), forCellReuseIdentifier: "tableShoppingCell")
        
    
    }
    
    //연락처뷰를 띄어준다
    func presentContactPicker() {
        let contactPickerVC = CNContactPickerViewController()
        contactPickerVC.delegate = self
        contactPickerVC.displayedPropertyKeys = [CNContactGivenNameKey,
                                                 CNContactFamilyNameKey,
                                                 CNContactPhoneNumbersKey]
        present(contactPickerVC, animated: true)
    }
    
    
}

extension GiftPaymentVC: CNContactPickerDelegate{
    
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        // You can fetch selected name and number in the following way
        
        // user name
        let userGivenName:String = contact.givenName
        let userFamilyName: String = contact.familyName
        
        // user phone number
        let userPhoneNumbers:[CNLabeledValue<CNPhoneNumber>] = contact.phoneNumbers
        let firstPhoneNumber:CNPhoneNumber = userPhoneNumbers[0].value
        
        
        // user phone number string
        let primaryPhoneNumberStr:String = firstPhoneNumber.stringValue
        
        let newContact = Contact(name: primaryPhoneNumberStr, phoneNumber: "\(userGivenName)\(userFamilyName)")
        
        contactArray.append(newContact)
        paymentTableView.reloadData()
        
        
    }
}

extension GiftPaymentVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            //메시지 입력 섹션
            let headerView = UIView()
            let enterMessageLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 90, height: 35))
            headerView.addSubview(enterMessageLabel)
            enterMessageLabel.text = "메시지 입력"
            enterMessageLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            return headerView
            
        } else if section == 1 {
            //보내는 사람 섹션
            let headerView = UIView()
            let senderLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 90, height: 35))
            headerView.addSubview(senderLabel)
            senderLabel.text = "보내는 사람"
            senderLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            return headerView
            
        } else if section == 2 {
            //전송 수단 섹션
            let headerView = UIView()
            let sendMethodLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 90, height: 35))
            headerView.addSubview(sendMethodLabel)
            sendMethodLabel.text = "전송 수단"
            sendMethodLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            return headerView
            
        } else if section == 3 {
            //받는 사람 섹션
            let headerView = UIView()
            let recieverLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 90, height: 35))
            let contactButton = UIButton(frame: CGRect(x: 310, y: 0, width: 90, height: 35))
            headerView.addSubview(recieverLabel)
            headerView.addSubview(contactButton)
            
            //받는사람 레이블 설정
            recieverLabel.text = "받는 사람"
            recieverLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            
            //연락처 추가 버튼 설정
            contactButton.setTitle("연락처 추가", for: .normal)
            contactButton.setTitleColor(.black, for: .normal)
            contactButton.layer.borderColor = UIColor.systemGray3.cgColor
            contactButton.layer.cornerRadius = 18
            contactButton.layer.borderWidth = 0.5
            contactButton.contentHorizontalAlignment = .center
            contactButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            contactButton.addTarget(self, action: #selector(addContactButtonTapped), for: .touchUpInside)
            contactButton.tag = section
            if giftSelf == true {
                contactButton.isHidden = true
            } else {
                contactButton.isHidden = false
            }
            return headerView
        } else if section == 4 {
            //결제 수단 섹션
            let headerView = UIView()
            let paymentMethodLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 150, height: 35))
            headerView.addSubview(paymentMethodLabel)
            //결제 수단 레이블 설정
            paymentMethodLabel.text = "결제수단"
            paymentMethodLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            return headerView
        }
        return UIView?.none
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 3 {
            let footerView = UIView()
            let giftSelfButton = UIButton(frame: CGRect(x: 10, y: 0, width: 200, height: 35))
            footerView.addSubview(giftSelfButton)
            
            //나에게 선물하기 버튼
            giftSelfButton.setImage(UIImage(systemName: "circle"), for: .normal)
            giftSelfButton.setTitle("나에게 선물하기", for: .normal)
            giftSelfButton.setTitleColor(.black, for: .normal)
            giftSelfButton.contentHorizontalAlignment = .leading
            giftSelfButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            giftSelfButton.addTarget(self, action: #selector(giftSelfButtonTapped), for: .touchUpInside)
            giftSelfButton.tag = section
            if giftSelf == true {
                giftSelfButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            } else {
                giftSelfButton.setImage(UIImage(systemName: "circle"), for: .normal)
            }
            
            return footerView
        }
        return UIView?.none
    }
    
    //연락처 추가 버튼 클릭시
    @objc func addContactButtonTapped(_ sender: UIButton) {
        presentContactPicker()
    }
    
    //나에게 선물하기 버튼 클릭시
    @objc func giftSelfButtonTapped(_ sender: UIButton) {
        giftSelf.toggle()
        contactArray.removeAll()
        paymentTableView.reloadData()
        // contactButton과 giftSelfButton에 접근할수 없어 giftSelf만 toggle해준다.
    }
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return contactArray.count
        }else if section == 5 {
            return coreDataManager.itemArray.count
        }else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textViewCell", for: indexPath)
            return cell
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "senderCell", for: indexPath)
            return cell
            
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sendMethodCell", for: indexPath)
            return cell
            
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! GiftContactTableViewCell
            //초기에 contactArray(연락처배열)은 비어있기때문에 다음과 같이 처리한다.
            if contactArray.count != 0 {
                cell.nameLabel.text = contactArray[indexPath.row].phoneNumber
                cell.phoneNumberLabel.text = contactArray[indexPath.row].name
            }
            return cell
            
        } else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "paymentMethodCell", for: indexPath)
            return cell
            
        } else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableShoppingCell", for: indexPath) as! GiftShoppingBasketTableViewCell
            cell.productImageview.image = UIImage()
            cell.nameLabel.text = coreDataManager.itemArray[indexPath.row].name!
            cell.priceLabel.text = "\(coreDataManager.itemArray[indexPath.row].total)원"
            cell.numberOfLabel.text = "\(coreDataManager.itemArray[indexPath.row].number)개"
            cell.plusView.isHidden = true
            cell.minusView.isHidden = true
            cell.cancelView.isHidden = true
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
           
            return cell
            
        } else if indexPath.section == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "totalPriceCell", for: indexPath) as! GiftTotalPriceTableViewCell
            return cell
        } else if indexPath.section == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textContentCell", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "paymentButtonCell", for: indexPath) as! GiftPaymentButtonTableViewCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }else if indexPath.section == 4 {
            return 35
        }else if indexPath.section == 5 {
            return 100
        } else if indexPath.section == 8{
            return 140
        } else {
            return 80
        }
    }
    
    
}
