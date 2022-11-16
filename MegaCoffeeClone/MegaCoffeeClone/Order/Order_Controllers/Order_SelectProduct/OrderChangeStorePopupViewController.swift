//
//  OrderChangeStorePopupViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/15.
//

import UIKit

enum ViewPresentationStyle {
    case push
    case present
}

class OrderChangeStorePopupViewController: UIViewController {

    @IBOutlet var popupView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 10
        
    }
    
    
    @IBAction func tapCancelButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func tapDoneButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Order", bundle: nil)
        
        guard let pvc = self.presentingViewController else { return }
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "orderNVC") as? UINavigationController else { return }
        
        if let orderVC = vc.viewControllers.last as? OrderViewController {
            orderVC.vcPresentationStyle = ViewPresentationStyle.present
        }
        
        self.dismiss(animated: false) {
            pvc.present(vc, animated: true)
        }
    }
}
