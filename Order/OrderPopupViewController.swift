//
//  OrderpopViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/06.
//

import UIKit

enum VcType {
    case select
    case search
}

class OrderPopupViewController: UIViewController {
    
    @IBOutlet var popupView: UIView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var goingToMenuButton: UIButton!
    
    @IBOutlet var orderButton: UIButton!
    
    
    @IBOutlet var popupViewHeight: NSLayoutConstraint!
    
    // 데이터 추가시 수정
    var storeData: StoreModel?
    
    var topVC: VcType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configStoreInfo()
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 20
    }
    
    func configStoreInfo() {
        if let storeData = storeData {
            titleLabel.text = "'\(storeData.name)'에서\n주문하시겠습니까?"
            
            contentLabel.text = storeData.isOn ? "주문 확인 후 취소가 불가합니다." : "매장 준비중 입니다."
            goingToMenuButton.isHidden = storeData.isOn ? true : false
            
            popupViewHeight.constant = storeData.isOn ? view.frame.height * 0.6 : view.frame.height * 0.7
            
            orderButton.isEnabled = storeData.isOn ? true : false
            orderButton.backgroundColor = storeData.isOn ? .done() : .gray
        }
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func tapOrderButton(_ sender: Any) {
        if let tvc = self.presentingViewController as? UITabBarController {
            if let nvc = tvc.selectedViewController as? UINavigationController {
                
                if topVC == VcType.select {
                    if let pvc = nvc.topViewController as? OrderViewController {
                        self.dismiss(animated: false) {
                            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "orderListVC") as? OrderListViewController else { return }
                            vc.storeData = self.storeData
                            pvc.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                } else if topVC == VcType.search {
                    if let pvc = nvc.topViewController as? SearchStoreViewController {
                        self.dismiss(animated: false) {
                            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "orderListVC") as? OrderListViewController else { return }
                            vc.storeData = self.storeData
                            pvc.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                }
            }
        }
    }
}


